Given /^I am on "(.+)"$/ do |page_path|
  visit page_path
end

Given /^I am not authenticated/ do
  page.driver.submit :delete, "/users/sign_out", {}
end

Given /^I am a new, authenticated user/ do
  email = 'test@mail.com'
  password = 'valid_password'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Login / Register"
end

Given /^New user/ do
  email = 'test@mail.com'
  password = 'valid_password'
  User.destroy_all
  User.new(:email => email, :password => password, :password_confirmation => password).save!
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I click "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.has_content? text
end
