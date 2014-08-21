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

    response = open(@base_url+path+api_key+per_page+query_string)

    @status = response.status[0].to_i

    if @status == 200
      @results = Array.new

      @results[0] = JSON.parse(response.read, symbolize_names: :true) if path == '/'
      @results = JSON.parse(response.read, symbolize_names: :true)[:results] if path != '/'

      @data[:api_reader_success] = true
    end

    @data[:api_reader_message] = 'No results found' if @results.size == 0 or @results == nil
    @data[:api_reader_message] = 'Path not found' if @status == 404

    @data[:api_reader_success] = false if @status != 200

  end
end
