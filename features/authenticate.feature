Feature: Login or Register
Input data to form
Click submit button

Scenario: Create a new session with invalid params
  Given I am not authenticated user
  Given New user
  Given I am on "/"
  When I fill in "user[email]" with ""
  When I fill in "user[password]" with ""
  When I press "Login / Register"
  Then I should see "Sorry we cannot process your request at the moment"

Scenario: Create a new session with invalid password
  Given I am not authenticated user
  Given New user
  Given I am on "/"
  When I fill in "user[email]" with "test@mail.com"
  When I fill in "user[password]" with "invalid_password"
  When I press "Login / Register"
  Then I should see "Invalid password"

Scenario: Create a new session with valid params
  Given I am not authenticated user
  Given New user
  Given I am on "/"
  When I fill in "user[email]" with "test@mail.com"
  When I fill in "user[password]" with "valid_password"
  When I press "Login / Register"
  Then I should see "Logged in successfully"