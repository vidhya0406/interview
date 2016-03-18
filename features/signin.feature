Feature: Sign in using email
    In order to test sign in using email
    I want to fill in valid and invalid credentials
    And verify the behaviour

Scenario: Sign in with valid or invalid credentials
    Given I have the email "<signin_email>"
    And I have the password "<singin_password>"
    When I fill out the form and "<action>"
    Then I should see "<result>"

Examples:
|signin_email                                                                                                               |signin_password|action |result        |
|abc@xyz.com                                                                                                                |aeren          |sign in|invalid login |
|abc                                                                                                                        |aeren          |sign in|invalid login |
|ahrfwehuiwehfuihweriytweuiyhuirywiahaejhrjuiyweiyriwweiytt4uiyteiyriweyiqasfewerwerqefwerfwerferdqefrewyrieiuqeyrafffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaajhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdgquuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuaaaaaaaaaagddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd@gmail.com|asrqre         |sign in|invalid login |
Scenario: Sign in without credentials
    Given I have the email ""
    And I have the password ""
    When I fill out the form and "sign in"
    Then I should see "required field"

Scenario: Transition to previous page on cancel
    Given I have the email "abc@xyz.com"
    And I have the password "aae"
    When I fill out the form and "cancel"
    Then I should see "login options"

Scenario: Verify if user can choose to remember password
    Given I have the email "abc@xyz.com"
    And I have the password "aae"
    Check if I can choose to "remember password"

Scenario: Verify if user can reset fields
    Given I have the email "abc@xyz.com"
    And I have the password "aae"
    Check if I can choose to "reset fields"

Scenario: Verify if user can do password recovery
    Given I have the email "abc@xyz.com"
    And I forgot password
    Check if I can choose to "recover password"

Scenario: Verify clicking back after sign in does not automatically sign out
    Given I have the email "abc@gmail.com"
    And I have the password "jas&"
    When I fill out the form and "sign in"
    Then I should see "dashboard page"
    When I click "back"
    Then I should see "sign out"

Scenario: After Transition to previous page on cancel, sign in again should not cache data
    Given I have the email "abc@xyz.com"
    And I have the password "aae"
    When I fill out the form and "cancel"
    Then I should see "login options"
    When I click "sign in with email"
    Check if credentials are not cached

Scenario: Verify if I cannot land on dashboard with direct url
    Given I have the email "abc@xyz.com"
    And I have the password "aae"
    When I visit "http://news360.com/web/intro"
    Then I should see "sign in with email"

