Given(/^User is on site$/) do
  visit '/'
end

Given(/^User is not signed in$/) do
  visit '/'
end

Given(/^User is signed in$/) do
  create :user

  visit '/users/sign_in'

  fill_in 'user_email', with: 'freyes@enova.com'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

