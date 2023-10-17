require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
    @cart = carts(:cart1)
    @cart_item = cart_items(:cart_item1)
  end

  test 'should redirect add_to_cart when not logged in' do
    assert_no_difference 'Cart.count' do
      post add_to_cart_carts_path, params: { cart: @cart.attributes }
    end

    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect remove_from_cart when not logged in' do
    assert_no_difference 'Cart.count' do
      delete remove_from_cart_carts_path
    end

    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect cart_update when not logged in' do
    patch cart_update_carts_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
end
