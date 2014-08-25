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
        col_split = column.split('_', 2)
        params[column] = bill[col_split[0].to_sym][col_split[1].to_sym]
      elsif column == 'related_bill_ids' || column == 'enacted_as'
        next
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
  api_reader.get("/bills", { :query => "highway", :page => page_num })

  create_bills(api_reader.results)

  page_num +=1
  break if api_reader.page_count < max_per_page
end

# Begin populating Legislators

page_num = 1

loop do
  api_reader.get("/legislators", { :page => page_num })

  create_legislators(api_reader.results)

  page_num +=1
  break if api_reader.page_count < max_per_page
end

