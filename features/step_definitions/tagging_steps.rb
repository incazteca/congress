# Givens

Given(/^Active bill$/) do
  create :active_bill
  visit '/bills/1'
end

Given(/^Non Active bill$/) do
  create :non_active_bill
  visit '/bills/1'
end

Given(/^User is on Legislator page$/) do
  create :legislator
  visit '/legislators/1'
end

# Whens

When(/^User attempts to tag a bill$/) do
  click_button 'Tag Bill'
end

When(/^User attempts to tag a legislator$/) do
  click_button 'Tag Legislator'
end

# Thens

Then(/^User should not see a tag button with "(.*?)"$/) do |tag_text|
  expect(page).to_not have_content(tag_text)
end

Then(/^Tag button should read "(.*?)"$/) do |tag_text|
  expect(page).to have_content(tag_text)
end

