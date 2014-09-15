# Givens

Given(/^User is on site with only one bill$/) do
  create :official_type
  create :short_type
  create :popular_type
  create :title
  create :bill
  visit '/'
end

Given(/^User is on site with only one legislator$/) do
  create :legislator
  visit '/'
end

Given(/^User is on site with one legislator and one bill$/) do
  create :official_type
  create :short_type
  create :popular_type
  create :title
  create :bill
  create :legislator
  visit '/'
end

# Whens

When(/^User searches by bill id$/) do
  fill_in 'search_term', with: 'hr3461-111'
  click_button 'Search'
end


When(/^User searches by bioguide id$/) do
  fill_in 'search_term', with: 'B000574'
  click_button 'Search'
end

Then(/^User should be taken to page for that legislator$/) do
  expect(page).to have_content('B000574')
end

When(/^User searches by title$/) do
  fill_in 'search_term', with: 'highway'
  click_button 'Search'
end

When(/^User searches with unsearchable string$/) do
  fill_in 'search_term', with: 'plaintains'
  click_button 'Search'
end

When(/^User searches without filling search field$/) do
  fill_in 'search_term', with: ''
  click_button 'Search'
end

# Thens

Then(/^User should be taken to page for that bill$/) do
  expect(page).to have_content('hr3461-111')
end

Then(/^User should be taken to result page with relevant bills$/) do
  expect(page).to have_content('Results')
end

Then(/^User should be taken to result page with no results message$/) do
  expect(page).to have_content('No results found for plaintains. Please try another search.')
end

Then(/^User should be taken to result page with default results$/) do
  expect(page).to have_content('Results')
end

