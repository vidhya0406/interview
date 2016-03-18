from lettuce import *
from splinter import *


@before.each_scenario
def setup_background(scenario):
    world.browser = Browser()
    url = 'http://www.news360.com'
    world.browser.visit(url)
    world.browser.find_by_text('Start reading').first.click()
    world.browser.find_by_text('Sign in with email').first.click()
    assert world.browser.url == 'https://news360.com/'


@step(u'Given I have the email "([^"]*)"')
def given_i_have_the_email_group1(step, group1):
    world.email = str(group1)


@step(u'And I have the password "([^"]*)"')
def and_i_have_the_password_group1(step, group1):
    world.password = str(group1)


@step(u'Then I should see "([^"]*)"')
def then_i_should_see_group1(step, group1):
    if group1 == 'invalid login':
        element = world.browser.find_by_css('.error-message.message.ng-binding').first
        if element.text == 'Invalid login or password':
            pass
        else:
            assert False, element.text
    elif group1 == 'required field':
        element = world.browser.find_by_css('.required').first
        if element.text == 'This value is required.':
            pass
        else:
            assert False, element.text
    elif group1 == 'login options':
        assert world.browser.is_text_present('Start with Twitter')

    elif group1 == 'dashboard page':
        assert world.browser.is_element_present_by_text('SAVED')

    elif group1 == 'sign out':
        assert world.browser.is_element_present_by_text('Sign out')

    elif group1 == 'email not found':
        element = world.browser.find_by_css('.error-message.message.ng-binding').first
        if element.text == "Email isn't found. Please try again":
            pass
        else:
            assert False, element.text

    elif group1 == 'email link sent':
        assert world.browser.is_element_present_by_text('We emailed you a link to reset your password')

    elif group1 == 'sign in':
        assert world.browser.is_element_present_by_text('Sign in')

    elif group1 == 'sign in with email':
        assert world.browser.is_element_present_by_text('Sign in with email')

    elif group1 == 'sign up':
        assert world.browser.is_element_present_by_text('Sign up')

    elif group1 == 'successfully signed up':
        element = world.browser.find_by_xpath('/html/body/div[2]/div[1]/h3')
        if element.text == "To begin, select a few topics you're interested in":
            pass
        else:
            assert False, element.text

    elif group1 == 'invalid credentials error':
        element = world.browser.find_by_css('.error-message.message.ng-binding').first
        if element.text == 'Invalid login or password':
            pass
        else:
            assert False, element.text

    elif group1 == 'password rules error':
        element = world.browser.find_by_css('.error-message.message.ng-binding').first
        if element.text == 'Password must be atleast 6 characters':
            pass
        else:
            assert False, element.text

    elif group1 == 'confirm email':
        assert world.browser.is_element_present_by_text('confirm email')
    else:
        assert False, 'Invalid expected result'


@step(u'When I click "([^"]*)"')
def when_i_click_group1(step, group1):
    if group1 == 'back':
        world.browser.back()

    elif group1 == 'sign in with email':
        world.browser.find_by_text('Sign in with email').first.click()

    else:
        assert False, group1


@step(u'When I fill out the form and "([^"]*)"')
def when_i_fill_out_the_form_and_group1(step, group1):
    if group1 == 'sign in':
        world.browser.find_by_id('signinemail').fill(world.email)
        world.browser.find_by_name('password').first.fill(world.password)
        world.browser.find_by_css('.green-button.ladda-button.signin-button').first.click()
    elif group1 == 'cancel':
        world.browser.find_by_id('signinemail').fill(world.email)
        world.browser.find_by_name('password').first.fill(world.password)
        element = world.browser.find_by_xpath('/html/body/div[1]/div[1]/div/div[5]/div[4]/form[4]/div[1]/button[1]').first
        if element.text == 'Cancel':
            element.click()
        else:
            assert False, element.visible

    elif group1 == 'reset':
        if world.browser.is_element_present_by_text('Forgot your password?'):
            world.browser.find_by_text('Forgot your password?').click()
        else:
            assert False, 'Forgot password not found'
        world.browser.find_by_id('resetemail').fill(world.email)
        if world.browser.is_element_present_by_text('Reset password'):
            world.browser.find_by_xpath('/html/body/div[1]/div[1]/div/div[5]/div[4]/form[2]/button').click()
        else:
            assert False, 'Reset password not found'

    elif group1 == 'do nothing':
        if world.browser.is_element_present_by_text('Forgot your password?'):
            world.browser.find_by_text('Forgot your password?').click()
        else:
            assert False, 'Forgot password not found'
        world.browser.find_by_id('resetemail').fill(world.email)

    elif group1 == 'signup':
        if world.browser.is_element_present_by_text('Sign up'):
            world.browser.find_by_xpath('/html/body/div[1]/div[1]/div/div[5]/div[4]/form[4]/div[2]/div[2]/a').click()
        else:
            assert False, 'Not able to find sign up'
        world.browser.find_by_id('signupemail').fill(world.email)
        world.browser.find_by_id('password').fill(world.password)
        world.browser.find_by_xpath('/html/body/div[1]/div[1]/div/div[5]/div[4]/form[3]/fieldset[3]/input').fill(world.confirm_password)
        element = world.browser.find_by_css('.green-button.ladda-button.signup-button.ng-binding')
        if element.text == 'Sign up':
             element.click()
        else:
            assert False, element.text

    else:
        assert False, group1


@step(u'Check if I can choose to "([^"]*)"')
def check_if_i_can_choose_to_group1(step, group1):
    if group1 == 'remember password':
        assert world.browser.is_element_present_by_text('Remember password?')
    elif group1 == 'recover password':
        assert world.browser.is_element_present_by_text('Forgot your password?')
    elif group1 == 'reset fields':
        assert world.browser.is_element_present_by_text('Reset')
    else:
        assert False, group1


@step(u'Check if credentials are not cached')
def check_if_credentials_are_not_cached(step):
    assert world.browser.find_by_id('signinemail').value is None, world.browser.find_by_id('signinemail').value
    assert world.browser.find_by_name('password').first.value is None, world.browser.find_by_name('password').first.value


@step(u'And I forgot password')
def and_i_forgot_password(step):
    element = world.browser.find_by_xpath('/html/body/div[1]/div[1]/div/div[5]/div[4]/form[4]/div[2]/div[1]/a').first
    if element.text == 'Forgot your password?':
        element.click()
    else:
        assert False, element.text


@step(u'And I have the confirm password "([^"]*)"')
def and_i_have_the_confirm_password_group1(step, group1):
    world.confirm_password = group1


@step(u'And I should be able to find "([^"]*)"')
def and_i_should_be_able_to_find_group1(step, group1):
    if group1 == 'logout':
        assert world.browser.is_element_present_by_text('Logout')
    else:
        assert False, group1


@step(u'When I visit "([^"]*)"')
def when_i_visit_group1(step, group1):
    world.browser.visit(group1)

@after.each_scenario
def cleanup(scenario):
    world.browser.quit()