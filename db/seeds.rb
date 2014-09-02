# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
def create_legislators(legislators = [])
  params = {}

  legislators.each do |legislator|
    Legislator.column_names.each do |column|

      if column == 'leadership_role_id' && legislator[:leadership_role] != nil
        LeadershipRole.find_or_create_by!(leadership_role: legislator[:leadership_role])
        params['leadership_role'] = legislator[:leadership_role]
      elsif column == 'party_id' && legislator[:party] != nil
        Party.find_or_create_by!(party: legislator[:party])
        params['party'] = legislator[:party]
      elsif column == 'chamber_id' && legislator[:chamber] != nil
        Chamber.find_or_create_by!(chamber: legislator[:chamber])
        params['chamber'] = legislator[:chamber]
      else
        params[column] = legislator["#{column}".to_sym]
      end
    end

    Legislator.create(params)
  end
end

def create_bills(bills = [])
  params = {}
  bills.each do |bill|

    Bill.column_names.each do |column|

      if /^history_.*/ =~ column
        history_cols = column.split('_', 2).map(&:to_sym)
        params[column] = bill[history_cols[0]][history_cols[1]]
      elsif column == 'chamber_id' && bill[:chamber] != nil
        Chamber.find_or_create_by!(chamber: bill[:chamber])
        params['chamber'] = bill[:chamber]
      elsif column == 'legislators_id'
        legislator =  Legislator.find_by(bioguide_id: bill[:sponsor_id])

        params['legislators_id'] = legislator.id if legislator != nil

        if legislator == nil
          #logger.warn "Legislator id #{bill[:sponsor_id]} not found in DB"
          puts "Legislator id #{bill[:sponsor_id]} not found in DB"
        end
      else
        params[column] = bill["#{column}".to_sym]
      end
    end

    Bill.create(params)

    create_title(bill[:official_title], 'official', bill[:bill_id])
    create_title(bill[:popular_title], 'popular', bill[:bill_id]) if bill[:popular_title] != nil
    create_title(bill[:short_title], 'short', bill[:bill_id]) if bill[:short_title] != nil
  end
end

def create_title(title, type, bill_id)
  bill_id = Bill.find_by(bill_id: bill_id).id

  TitleType.find_or_create_by!(title_type: type)
  Title.create(bills_id: bill_id, title: title, title_type: type)
end

base_url = 'https://congress.api.sunlightfoundation.com'
api_key = '300952facb214f5983867ed073e7e4ba'

api_reader = CongressAPIReader.new(base_url, api_key)

max_per_page = 50

# Begin populating Legislators

page_num = 1

loop do
  response = api_reader.get("/legislators", { :page => page_num, :per_page => max_per_page })
  create_legislators(response.results)

  page_num +=1
  break if response.count_on_page < max_per_page
end

# Begin populating bills

page_num = 1

loop do

  response = api_reader.get("/bills", { :query => "highway", :page => page_num, :per_page => max_per_page })
  create_bills(response.results)

  page_num +=1
  break if response.count_on_page < max_per_page
end

