FactoryGirl.define do
  factory :legislator do
    id 1
    bioguide_id 'B000574'
    title 'Rep'
    first_name 'Earl'
    middle_name nil
    last_name 'Blumenauer'
    name_suffix nil
    nickname nil
    in_office true
    birthday '1948-08-16'
    term_end '2015-01-03'
    term_start '2013-01-03'
    contact_form 'https://forms.house.gov/blumenauer/webforms/issue_...'
    district '3'
    gender 'M'
    office '1111 Longworth House Office Building'
    state 'OR'
    state_name 'Oregon'
    website 'http://blumenauer.house.gov'
    party_id 2
    leadership_role_id nil
    chamber_id 1
  end
end
