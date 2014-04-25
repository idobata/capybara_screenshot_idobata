Feature: Work capybara_screenshot_idobata
  Scenario: Post screenshot to Idobata
  When  Visit to "https://idobata.io/"
  And  Call `save_screenshot_and_post_to_idobata`
  Then Post screenshot to Idobata
