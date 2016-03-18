Feature: Signup with email and password
    In order to test sign up
    I want to fill in valid and invalid credentials
    And verify the behavior

Scenario: Sign up with valid credentials
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "successfully signed up"

Scenario: Sign up with invalid credentials
    Given I have the email "ab"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "invalid credentials error"

Scenario: Sign up with only space as password
    Given I have the email "abcd@xyz.com"
    And I have the password "      "
    And I have the confirm password "      "
    When I fill out the form and "signup"
    Then I should see "password rules error"

Scenario: Sign up with repeating characters as password
    Given I have the email "abcd@xyz.com"
    And I have the password "aaaaaa"
    And I have the confirm password "aaaaaa"
    When I fill out the form and "signup"
    Then I should see "password rules error"

Scenario: Sign up with blank password
    Given I have the email "abcd@xyz.com"
    And I have the password ""
    And I have the confirm password ""
    When I fill out the form and "signup"
    Then I should see "invalid credentials error"

Scenario: Sign up with unusually long email
    Given I have the email "abmjafjkwfejkrfuwefyrueuweturtkweutkuwertwekrweyuketwukteuktyuwetrbktrubqcyutuytqwybutyukqtwucweicweeeeeeeetyutrwerwycweeebecmjauifwygeyryuwruwgurguytb2uyyct@gmail.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "invalid credentials error"

Scenario: Sign up with unusually long password
    Given I have the email "myemail@domain.com"
    And I have the password "abcdefghmnbvcxzaq12wdxd3edcfrfvftrgtyuioppoiutrergbnkopoiuytrrrfjkppppoiuyttrffghjkpppoiiiiiiiiiiiiiiwqrettttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
    And I have the confirm password "abcdefghmnbvcxzaq12wdxd3edcfrfvftrgtyuioppoiutrergbnkopoiuytrrrfjkppppoiuyttrffghjkpppoiiiiiiiiiiiiiiwqrettttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
    When I fill out the form and "signup"
    Then I should see "invalid credentials error"

Scenario: Fill valid credentials and cancel
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "cancel"
    Then I should see "sign in options"

Scenario: Check if the user has to validate email
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "confirm email"

Scenario: Logout after signup
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "successfully signed up"
    And I should be able to find "logout"

Scenario: Signup, logout and sign in
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    And I have the confirm password "abcdefgh"
    When I fill out the form and "signup"
    Then I should see "successfully signed up"
    And I should be able to find "logout"
    Given I have the email "ab@yxz.com"
    And I have the password "abcdefgh"
    When I fill out the form and "signin"
    Then I should see "dashboard page"
