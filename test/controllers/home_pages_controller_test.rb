require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_url
    assert_response :success
    assert_select 'title', 'Food Vault'
  end

  test 'should get help' do
    get help_url
    assert_response :success
    assert_select 'title', 'Help | Food Vault'
  end

  test 'should get about' do
    get about_url
    assert_response :success
    assert_select 'title', 'About | Food Vault'
  end

  test 'should get contact' do
    get contact_url
    assert_response :success
    assert_select 'title', 'Contact | Food Vault'
  end
end
