from lettuce import *
from splinter import *

@step(u'Given I have the email "([^"]*)"')
def given_i_have_the_email_group1(step, group1):
    world.email = str(group1)


@step(u'And I have the password "([^"]*)"')
def and_i_have_the_password_group1(step, group1):
    world.password = str(group1)


@step(u'Then I fill out the form and "([^"]*)" for "([^"]*)" sessions')
def then_i_fill_out_the_form_and_group1_for_group2_sessions(step, group1, group2):
    if group2 == '10':
        count = 10
    elif group2 == '100':
        count = 100
    elif group2 == '1000':
        count = 1000
    else:
        count = 1
    world.sessions = []
    for i in range(count):
        world.browser = Browser()
        world.sessions.append(world.browser)
        url = 'http://www.news360.com'
        world.browser.visit(url)
        world.browser.find_by_text('Start reading').first.click()
        world.browser.find_by_text('Sign in with email').first.click()
        if group1 == 'sign in':
            world.browser.find_by_id('signinemail').fill(world.email)
            world.browser.find_by_name('password').first.fill(world.password)
            world.browser.find_by_css('.green-button.ladda-button.signin-button').first.click()
        else:
            assert False, group1
    for instance in world.sessions:
        instance.quit()
