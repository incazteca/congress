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

    api_key = "?apikey=#{@api_key}"

    per_page = "&per_page=50"

    query_string = ''
    query_string += "&query=#{options[:query] }" if options[:query] != nil
    query_string += "&bill_id=#{options[:bill_id] }" if options[:bill_id] != nil
    query_string += "&bioguide_id=#{options[:bioguide_id] }" if options[:bioguide_id] != nil
    query_string += "&page=#{options[:page] }" if options[:page] != nil

    @data = Hash.new

    begin
      response = open(@base_url+path+api_key+per_page+query_string)
    rescue SocketError => sock_e
      set_data(sock_e.message, false)
    rescue OpenURI::HTTPError => http_e
      set_data(http_e.message, false)
      @status = 404
    else
      @status = response.status[0].to_i

      set_results(JSON.parse(response.read, symbolize_names: :true), path)
      set_data('No results found', true) if @count == 0
      set_data('Success', true) if @count > 0
    end
  end

  def set_data(message, success)
      @data[:api_reader_message] = message
      @data[:api_reader_success] = success
  end

  def set_results(results, path)
    @results = Array.new
    if path == '/'
      @results[0] = results
      @page = 0
      @count = 0
    else
      @results = results[:results]
      @page = results[:page][:page]
      @page_count = results[:page][:count]
      @count = results[:count]
    end
  end
end
