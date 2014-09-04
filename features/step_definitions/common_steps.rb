Given(/^User is on site$/) do
  visit '/'
end

Then(/^User should be notified of invalid login$/) do
  expect(page).to have_content('Sorry, the email or password could have been mistyped. Please try again')
    pending # express the regexp above with the code you wish you had
end
