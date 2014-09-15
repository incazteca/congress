Given(/^User is on registrations page$/) do
  visit 'users/sign_up'
end

When(/^User inputs correct information into registration form$/) do
  fill_in 'reg_email', with: 'freyes@enova.com'
  fill_in 'reg_fname', with: 'Franco'
  fill_in 'reg_lname', with: 'Reyes'
  fill_in 'reg_password', with: 'password'
  fill_in 'reg_confirm', with: 'password'
  click_button 'Register'
end

Then(/^User should be notified of succesful registration and logged in$/) do
  expect(page).to have_content('Registration Successful')
  expect(page).to have_content('Welcome Franco')
end

When(/^User inputs invalid information into registration form$/) do
  fill_in 'reg_email', with: 'freyes@enova.com'
  fill_in 'reg_fname', with: 'Franco'
  fill_in 'reg_lname', with: 'Reyes'
  fill_in 'reg_password', with: 'password'
  fill_in 'reg_confirm', with: 'paword'
  click_button 'Register'
end

Then(/^User should be notified of invalid registration$/) do
  expect(page).to have_content('Registration Unsuccessful')
end
