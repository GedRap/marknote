When(/^I visit the homepage$/) do
  visit "/"
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end