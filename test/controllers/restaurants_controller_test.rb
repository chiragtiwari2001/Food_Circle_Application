require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @outlet = restaurants(:gurukripa)
    @other_outlet = restaurants(:shreemaya)
  end

  test "should redirect new when not logged in" do
    get new_restaurant_path
    assert_response :redirect
  end

  test "should redirect new when logged in as member" do
    sign_in users(:michael)
    get new_restaurant_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redriect create when not logged in" do
    image_file = fixture_file_upload('tmp/test.jpg', 'image/jpeg')

    assert_no_difference 'Restaurant.count' do
      post restaurants_path, params: {restaurant: {restaurant_name: "example",
                                      restaurant_email: "example@user.com", restaurant_contact: 1234567890, restaurant_address: "scheme-64", 
                                      restaurant_image:'assets/background.webp',status: 'open', 
                                      restaurant_details: 'a place to eat',
                                      restaurant_image: image_file } }
    end
    
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
  
  test "should redriect create when logged in as member" do
    image_file = fixture_file_upload('tmp/test.jpg', 'image/jpeg')
    sign_in users(:michael)

    assert_no_difference 'Restaurant.count' do
      post restaurants_path, params: {restaurant: {restaurant_name: "example",
                                      restaurant_email: "example@user.com", restaurant_contact: 1234567890, restaurant_address: "scheme-64", 
                                      restaurant_image:'assets/background.webp',status: 'open', 
                                      restaurant_details: 'a place to eat',
                                      restaurant_image: image_file } }
    end

    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get edit_restaurant_path(@outlet)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect edit when logged in as member" do
    sign_in users(:michael)
    get edit_restaurant_path(@outlet)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit for wrong restaurant" do
    sign_in users(:gurukripa)
    get edit_restaurant_path(@other_outlet)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    patch restaurant_path(@outlet)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect update when logged in as member" do
    sign_in users(:michael)
    patch restaurant_path(@outlet), params: {restaurant: {restaurant_name: "K3",
                                            restaurant_email: "k3@gmail.com"
                                            } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update for wrong restaurant" do
    sign_in users(:gurukripa)
    patch restaurant_path(@other_outlet), params: {restaurant: {
                                          restaurant_name: "guru", restaurant_email: "guru@gmail.com" 
                                          } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Restaurant.count' do
      delete restaurant_path(@outlet)
    end
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when logged in as member" do
    sign_in users(:michael)
    assert_no_difference 'Restaurant.count' do
      delete restaurant_path(@outlet)
    end
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy for wrong restaurant" do
    sign_in users(:gurukripa)
    assert_no_difference 'Restaurant.count' do
      delete restaurant_path(@other_outlet)
    end
    assert_not flash.empty?
    assert_redirected_to root_url
  end
end
