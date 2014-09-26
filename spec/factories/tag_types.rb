FactoryGirl.define do
  factory :tag_type do
    factory :bill_tag_type do
      tag_type 'bill'
    end

    factory :legislator_tag_type do
      tag_type 'legislator'
    end
  end
end
