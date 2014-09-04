# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
def create_legislators(legislators)

  legislators.each do |legislator|
    params = legislator.select { |k, _| Legislator.column_names.include? k.to_s }

    params[:leadership_role] = LeadershipRole.find_or_create_by!(leadership_role: legislator[:leadership_role])
      .leadership_role unless legislator[:leadership_role].nil?

    params[:party] = Party.find_or_create_by!(party: legislator[:party]).party
    params[:chamber] = Chamber.find_or_create_by!(chamber: legislator[:chamber]).chamber

    Legislator.create(params)
  end
end

def create_bills(bills)
  params = {}
  bills.each do |bill|
    params = bill.select { |k, _| Bill.column_names.include? k.to_s }

    params[:history_active] = bill[:history][:active]
    params[:history_awaiting_signature] = bill[:history][:awaiting_signature]
    params[:history_enacted] = bill[:history][:enacted]
    params[:history_vetoed] = bill[:history][:vetoed]

    params[:chamber] = Chamber.find_or_create_by!(chamber: bill[:chamber]).chamber

    legislator = Legislator.find_by(bioguide_id: bill[:sponsor_id])
    params[:legislators_id] = legislator.id unless legislator.nil?
    puts "Legislator id: #{bill[:sponsor_id]} not found in DB" if legislator.nil?

    Bill.create(params)

    create_title(bill[:official_title], 'official', bill[:bill_id])
    create_title(bill[:popular_title], 'popular', bill[:bill_id]) unless bill[:popular_title].nil?
    create_title(bill[:short_title], 'short', bill[:bill_id]) unless bill[:short_title].nil?

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

