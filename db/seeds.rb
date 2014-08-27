# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'pry'
def create_bills(bills = [])
  params = {}
  bills.each do |bill|
    Bill.column_names.each do |column|

      if /^history_.*/ =~ column
        col_split = column.split('_', 2).map(&:to_sym)
        params[column] = bill[col_split[0]][col_split[1]]
      else
        params[column] = bill["#{column}".to_sym]
      end
    end

    Bill.create(params)
  end
end

def create_legislators(legislators = [])
  params = {}
  legislators.each do |legislator|
    Legislator.column_names.each do |column|
      params[column] = legislator["#{column}".to_sym]
    end

    Legislator.create(params)
  end
end

base_url = 'https://congress.api.sunlightfoundation.com'
api_key = '300952facb214f5983867ed073e7e4ba'

api_reader = CongressAPIReader.new(base_url, api_key)

max_per_page = 50

# Begin populating bills

page_num = 1

loop do

  response = api_reader.get("/bills", { :query => "highway", :page => page_num, :per_page => max_per_page })
  create_bills(response.results)

  page_num +=1
  break if response.count_on_page < max_per_page
end

# Begin populating Legislators

page_num = 1

loop do
  response = api_reader.get("/legislators", { :page => page_num, :per_page => max_per_page })
  create_legislators(response.results)

  page_num +=1
  break if response.count_on_page < max_per_page
end

