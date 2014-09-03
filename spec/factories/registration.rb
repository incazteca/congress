FactoryGirl.define do
  factory :successful_registration do
    email             'freyes@enova.com'
    first_name        'Franco'
    last_name         'Reyes'
    password          'password'
    password_conf     'password'
  end

  factory :unsuccessful_registration_bad_email do
    email             'freyes'
    first_name        'Franco'
    last_name         'Reyes'
    password          'password'
    password_conf     'password'
  end

  factory :unsuccessful_registration_no_name do
    email             'freyes@enova.com'
    first_name        ''
    last_name         ''
    password          'password'
    password_conf     'password'
  end

  factory :unsuccessful_registration_bad_password do
    email             'freyes@enova.com'
    first_name        'Franco'
    last_name         'Reyes'
    password          'password'
    password_conf     'pasword'
  end

end
