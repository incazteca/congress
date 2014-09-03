FactoryGirl.define do
  factory :succesful_login do
    email     'freyes@enova.com'
    password  'password'
  end

  factory :wrong_password do
    email     'freyes@enova.com'
    password  'wrongpassword'
  end

  factory :wrong_email do
    email     'notright@enova.com'
    password  'password'
  end
end
