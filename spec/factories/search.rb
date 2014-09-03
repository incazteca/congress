FactoryGirl.define do
  factory :bill_search do
    search      'hr3461-111'
  end

  factory :legislator_search do
    search      'B000574'
  end

  factory :title_search do
    search      'highway'
  end

  factory :bad_search do
    search      'plaintains'
  end

  factory :empty_search do
    search      ''
  end
end
