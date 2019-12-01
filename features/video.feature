Feature: Create New Video
Input data to form
Click submit button

Scenario: User must login before sharing new movie
  Given I am on "/"
  Given I am a new, authenticated user
  Then I should see "Share a movie"
  When I click "Share a movie"
  Then I should see "Youtube URL"

Scenario: Create new video with blank Youtube URL
  Given I am a new, authenticated user
  Given I am on "/videos/new"
  Then I should see "Youtube URL"
  When I fill in "video[url]" with ""
  When I press "Share Video"
  Then I should see "Url can't be blank"

Scenario: Create new video with given Youtube URL
  Given I am a new, authenticated user
  Given I am on "videos/new"
  Then I should see "Youtube URL"
  When I fill in "video[url]" with "https://www.youtube.com/watch?v=_jRHaMvInIU"
  When I press "Share Video"
  Then I should see "Video was successfully created."
  Then I should see "Shared by test@mail.com"