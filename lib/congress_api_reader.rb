require 'open-uri'
require 'json'
require 'pry'

class CongressAPIReader
  attr_accessor :status, :data, :results
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

    @data = Hash.new

    begin
      response = open(@base_url+path+api_key+per_page+query_string)
    rescue SocketError => sock_e
      @data[:api_reader_message] = sock_e.message
      @data[:api_reader_success] = false
    rescue OpenURI::HTTPError => http_e
      @data[:api_reader_message] = http_e.message
      @data[:api_reader_success] = false
      @status = 404
    else
      @status = response.status[0].to_i

      @results = Array.new

      @results[0] = JSON.parse(response.read, symbolize_names: :true) if path == '/'
      @results = JSON.parse(response.read, symbolize_names: :true)[:results] if path != '/'

      @data[:api_reader_success] = true
      @data[:api_reader_message] = 'No results found' if @results.size == 0 or @results == nil
    end
  end
end
