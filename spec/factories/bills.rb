# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill do
    id 1
    bill_id 'hr3461-111'
    number '3461'
    congress '111'
    history_awaiting_signature false
    history_enacted false
    history_vetoed false
    introduced_on '2009-07-31 00:00:00'
    last_action_at '2009-08-03 00:00:00'
    last_version_on '2009-07-31 00:00:00'
    last_vote_at nil
    sponsor_id 'B000574'
    cosponsors_count 3
    withdrawn_cosponsors_count '0'
    chamber_id 1
    legislator_id 46

    trait :active do
      history_active true
    end

    trait :not_active do
      history_active false
    end
  end
end
