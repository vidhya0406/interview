Feature: Forgot password
    In order to test forgot password
    I want to fill in valid or invalid credentials
    And verify behavior

Scenario: Reset with registered email
    Given I have the email "abc@xyz.com"
    When I fill out the form and "reset"
    Then I should see "email link sent"

Scenario: Reset with invalid email
    Given I have the email "abc"
    When I fill out the form and "reset"
    Then I should see "email not found"

Scenario: Reset with unregistered long email
    Given I have the email "ahrfwehuiwehfuihweriytweuiyhuirywiahaejhrjuiyweiyriwweiytt4uiyteiyriweyiqasfewerwerqefwerfwerferdqefrewyrieiuqeyrafffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaajhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdgquuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuaaaaaaaaaagddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd@gmail.com"
    When I fill out the form and "reset"
    Then I should see "email not found"

Scenario: Navigate from reset password to sign in
    Given I have the email "abc"
    When I fill out the form and "do nothing"
    Then I should see "sign in"

Scenario: Navigate from reset password to sign up
    Given I have the email "abc"
    When I fill out the form and "do nothing"
    Then I should see "sign up"