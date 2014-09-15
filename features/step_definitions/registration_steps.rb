# Given

Given(/^User is on registrations page$/) do
  visit '/users/sign_up'
end

# Whens

When(/^User inputs correct information into registration form$/) do
  fill_in 'user_email', with: 'freyes@enova.com'
  fill_in 'user_first_name', with: 'Franco'
  fill_in 'user_last_name', with: 'Reyes'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button 'Sign Up'
end

When(/^User inputs invalid information into registration form$/) do
  fill_in 'user_email', with: 'freyes@enova.com'
  fill_in 'user_first_name', with: 'Franco'
  fill_in 'user_last_name', with: 'Reyes'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'paword'
  click_button 'Sign Up'
end

# Thens

Then(/^User should be notified of succesful registration and logged in$/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Franco Reyes')
end

Then(/^User should be notified of invalid registration$/) do
  expect(page).to have_content('error prohibited this user from being saved:')
end
