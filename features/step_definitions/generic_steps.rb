When(/^I visit the homepage$/) do
  visit "/"
end

When(/^I visit Notes$/) do
	visit "/browse/notes"
end

When(/^I visit Tags$/) do
	visit "/tags/all"
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end

Then(/^I type in "(.*?)" in "(.*?)"$/) do |text, field|
	fill_in field, with: text
end

When(/^I click on "(.*?)"$/) do |label|
	click_on label
end

When(/^I click on element "(.*?)"$/) do |id|
	find("##{id}").click
end