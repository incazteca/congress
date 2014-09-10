When(/^User inputs correct credentials$/) do
  fill_in 'email', with: 'freyes@enova.com'
  fill_in 'password', with: 'password'
  click_button 'Login'
end

Then(/^User should be logged in$/) do
  expect(page).to have_content('Welcome Franco')
end

When(/^User inputs incorrect password$/) do
  fill_in 'email', with: 'freyes@enova.com'
  fill_in 'password', with: 'wrongpassword'
  click_button 'Login'
end

When(/^User inputs incorrect email$/) do
  fill_in 'email', with: 'notright@enova.com'
  fill_in 'password', with: 'password'
  click_button 'Login'
end

