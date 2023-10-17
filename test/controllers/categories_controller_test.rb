require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess

  def setup
    @category = categories(:italian)
  end

  test 'should get show' do
    get category_path(@category)
    assert_response :redirect
  end

  test 'should redirect new when not logged in' do
    get new_category_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect new when logged in as member' do
    sign_in users(:michael)
    get new_category_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: @category.attributes }
    end

    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect create when logged in as member' do
    sign_in users(:michael)

    assert_no_difference 'Category.count' do
      post categories_path, params: { category: @category.attributes }
    end

    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect edit when not logged in' do
    get category_path(@category)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect edit when logged in as member' do
    sign_in users(:michael)
    get edit_category_path(@category)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when not logged in' do
    patch category_path(@category),
          params: { category: { category_name: 'Burger', category_image: 'app\assets\images\background.webp' } }

    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'should redirect update when logged in as member' do
    sign_in users(:michael)
    patch category_path(@category),
          params: { category: { category_name: 'burger', category_image: 'app\assets\images\background.webp' } }

    assert_not flash.empty?
    assert_redirected_to root_url
  end
end
