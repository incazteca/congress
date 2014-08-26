require 'open-uri'
require 'json'
require 'pry'

class CongressAPIReader
  attr_accessor :status, :data, :results
  attr_reader :count, :page, :page_count
  attr_writer :api_key, :base_url

  def initialize(base_url, api_key)
    @api_key = api_key
    @base_url = base_url
  end

  def get(path = '/', options = {})

    response = open(@base_url+path+query_string(options))

    status_ar = response.status
    results = JSON.parse(response.read, symbolize_names: true)

    response_data(results, status_ar)

  rescue SocketError => sock_e
    puts sock_e.message
    #response_data([], nil, sock_e.message)
  rescue OpenURI::HTTPError => http_e
    puts http_e.message
    #response_data([] , 404, http_e.message)
  end

  private

  def response_data(results, status_ar,  message = '')

    response = Struct.new(:http_results, :http_status, :message) do
      def results
        http_results[:results]
      end

      def status
       http_status
      end

      def message
        message
      end

      def page
        0 unless http_results[:page][:page]
      end

      def per_page
        0 unless http_results[:page][:per_page]
      end

      def count
        0 unless http_results[:count]
      end
    end

    message = status_ar[1] if message == ''
    return response.new(results, status_ar[0].to_i, message)
  end

  def query_string(options)
    query_string = "?apikey=#{@api_key}"

    query_string += "&per_page=50" if options[:per_page] == nil

    options.each do |k,v|
      query_string += "&#{k.to_s}=#{v}"
    end

    query_string
  end

end
