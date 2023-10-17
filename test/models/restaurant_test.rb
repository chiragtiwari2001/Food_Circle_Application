require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @outlet = Restaurant.new(restaurant_name: 'example outlet', restaurant_email: 'user@example.com',
                             restaurant_details: 'this is a details for example outlet', restaurant_address: '44-b example colony', restaurant_contact: 1234567890, 
                             status: '')
  end

  test 'Restaurant name should be present' do
    @outlet.restaurant_name = ''
    assert_not @outlet.valid?
  end

  test 'Restaurant address should be present' do
    @outlet.restaurant_address = ''
    assert_not @outlet.valid?
  end

  test 'Restaurant contact should be present' do
    @outlet.restaurant_contact = ''
    assert_not @outlet.valid?
  end

  test 'contact should not be more than 10 digits' do
    @outlet.restaurant_contact = '1' * 11
    assert_not @outlet.valid?
  end

  test 'contact should not be less than 10 digits' do
    @outlet.restaurant_contact = '1' * 9
    assert_not @outlet.valid?
  end

  test 'Restaurant email should be present' do
    @outlet.restaurant_email = ''
    assert_not @outlet.valid?
  end

  test 'Restaurant email should accept valid email addresses' do
    @valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn]
    @valid_addresses.each do |valid_address|
      @outlet.restaurant_email = valid_address
      assert @outlet.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email should reject invalid email addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @outlet.restaurant_email = invalid_address
      assert_not @outlet.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'Restaurant email should be unique' do
    @duplicate_outlet = @outlet.dup
    @outlet.save
    assert_not @duplicate_outlet.valid?
  end
end
