require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess

  def setup
    @category = categories(:italian)
    @food = foods(:burger)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Food.count' do
      post category_foods_path(@category), params: { food: @food.attributes }
    end

    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'Should redirect create when logged in as member' do
    sign_in users(:michael)

    assert_no_difference 'Food.count' do
      post category_foods_path(@category), params: { food: @food.attributes }
    end

    assert_not flash.empty?
    assert_redirected_to root_url
  end
end
