require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
    @outlet = restaurants(:gurukripa)
    @order = orders(:order1)
    @order_item = order_items(:order_item1)
  end

  test 'should get index' do
    sign_in @user
    get orders_path
    assert_response :success
  end

  test 'should redirect all_orders when not logged in' do
    get all_orders_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect all_orders when logged in as member' do
    sign_in users(:michael)
    get all_orders_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end
end
