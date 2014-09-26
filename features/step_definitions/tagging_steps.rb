# Givens

Given(/^Active bill$/) do
  create :official_type
  create :short_type
  create :popular_type
  create :title
  create :bill, :active
  create :bill_tag_type
  visit '/bills/1'
end

Given(/^Non Active bill$/) do
  create :official_type
  create :short_type
  create :popular_type
  create :title
  create :bill, :not_active
  create :bill_tag_type
  visit '/bills/1'
end

Given(/^User is on Legislator page$/) do
  create :legislator
  create :legislator_tag_type
  visit '/legislators/1'
end

# Whens

When(/^User attempts to tag a bill$/) do
  click_button 'Tag for Updates'
end

When(/^User attempts to tag a legislator$/) do
  click_button 'Tag for Updates'
end

# Thens

Then(/^User should not see a tag button with "(.*?)"$/) do |tag_text|
  expect(page).to_not have_content(tag_text)
end

Then(/^Tag button should read "(.*?)"$/) do |tag_text|
  expect(page).to have_content(tag_text)
end
