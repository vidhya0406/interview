Feature: Load test for sign in with email

Scenario: valid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerty"
    Then I fill out the form and "sign in" for "10" sessions

Scenario: invalid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerartweyuqereytryteutreyutrqutyutreyuetyuteytrtyuteutruetyutqytruvty"
    Then I fill out the form and "sign in" for "10" sessions

Scenario: valid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerty"
    Then I fill out the form and "sign in" for "100" sessions

Scenario: invalid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerartweyuqereytryteutreyutrqutyutreyuetyuteytrtyuteutruetyutqytruvty"
    Then I fill out the form and "sign in" for "100" sessions


Scenario: valid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerty"
    Then I fill out the form and "sign in" for "1000" sessions

Scenario: invalid sign sessions to website
    Given I have the email "abc@gmail.com"
    And I have the password "qwerartweyuqereytryteutreyutrqutyutreyuetyuteytrtyuteutruetyutqytruvty"
    Then I fill out the form and "sign in" for "1000" sessions
