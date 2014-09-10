When(/^User searches by bill id$/) do
  fill_in 'search_term', with: 'hr3461-111'
  click_button 'Search'
end

Then(/^User should be taken to page for that bill$/) do
  expect(page).to have_content('hr3461-111')
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

Then(/^User should be taken to result page with relevant bills$/) do
  expect(page).to have_content('Results')
end

When(/^User searches with unsearchable string$/) do
  fill_in 'search_term', with: 'plaintains'
  click_button 'Search'
end

Then(/^User should be taken to result page with no results message$/) do
  expect(page).to have_content('No results found for plaintains. Please try another search.')
end

When(/^User searches without filling search field$/) do
  fill_in 'search_term', with: ''
  click_button 'Search'
end

Then(/^User should be taken to result page with default results$/) do
  expect(page).to have_content('Results')
end

