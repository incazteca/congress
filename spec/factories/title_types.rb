FactoryGirl.define do
  factory :title_type do

    factory :official_type do
      title_type "official"
    end

    factory :short_type do
      title_type "short"
    end

    factory :popular_type do
      title_type "popular"
    end

  end
end
