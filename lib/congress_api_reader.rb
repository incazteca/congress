require 'open-uri'
require 'json'
require 'pry'

class CongressAPIReader
  attr_reader :api_key, :base_url

  def initialize(base_url, api_key)
    @api_key = api_key
    @base_url = base_url
  end

  def get(path = '/', options = {})
    response = open(@base_url + path + query_string(options))

    status_ar = response.status

    results = JSON.parse(response.read, symbolize_names: true) if path != '/'
    results = [JSON.parse(response.read, symbolize_names: true)] if path == '/'

    response_data(path, results, status_ar[0].to_i, status_ar[1])

  rescue SocketError => sock_e
    response_data(path, nil, nil, sock_e.message)
  rescue OpenURI::HTTPError => http_e
    response_data(path, nil, http_e.message.split[0].to_i, http_e.message)
  end

  private

  def response_data(path, results, status, message)
    response = Struct.new(:path, :http_results, :http_status, :http_message) do
      def results
        return http_results if path == '/'
        http_results[:results]
      end

      def status
        http_status
      end

      def message
        return 'No results found' if count == 0 && !http_results.nil?
        http_message
      end

      def page
        return 0 if http_results.nil?
        http_results[:page][:page]
      end

      def per_page
        return 0 if http_results.nil?
        http_results[:page][:per_page]
      end

      def count_on_page
        return 0 if http_results.nil?
        http_results[:page][:count]
      end

      def count
        return 0 if http_results.nil?
        http_results[:count]
      end
    end

    response.new(path, results, status, message)
  end

  def query_string(options)
    query_string = "?apikey=#{@api_key}"

    query_string += '&per_page=50' if options[:per_page].nil?

    options.each do |k, v|
      query_string += "&#{k}=#{v}"
    end

    query_string
  end
end
