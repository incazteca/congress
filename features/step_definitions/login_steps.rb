# Givens
Given(/^User is on login page with account$/) do
  create :user
  visit '/users/sign_in'
end

Given(/^User is on login page with no account$/) do
  visit '/users/sign_in'
end

# Whens

When(/^User inputs correct credentials$/) do
  fill_in 'user_email', with: 'freyes@enova.com'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

When(/^User inputs incorrect password$/) do
  fill_in 'user_email', with: 'freyes@enova.com'
  fill_in 'user_password', with: 'wrongpassword'
  click_button 'Log in'
end

When(/^User inputs incorrect email$/) do
  fill_in 'user_email', with: 'notright@enova.com'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

# Thens

Then(/^User should be logged in$/) do
  expect(page).to have_content('Franco Reyes')
end

Then(/^User should be notified of invalid login$/) do
  expect(page).to have_content('Invalid email or password.')
end

Then(/^User should be notified of non-existant account$/) do
  expect(page).to have_content('Invalid email address or password.')
end
