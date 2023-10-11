require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:john)
    @other_user = users(:michael)
  end

  test "member user cannot access all users" do
    sign_in @other_user
    get users_path
    assert_response :redirect
  end

  test "admin can access all users" do
    sign_in @user
    get users_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert flash
    assert_redirected_to new_user_session_path
  end
  
  test "should redirect edit when logged in as member" do
    sign_in @other_user
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to root_url 
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user), params: {user: {username: @user.username,
                                            email: @user.email 
                                            } }
    assert flash
    assert_redirected_to new_user_session_path
  end
  
  test "should redirect update when logged in as member" do
    sign_in @other_user
    patch user_path(@user), params: {user: {username: @user.username,
                                            email: @user.email 
                                            } }
    assert flash
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when logged in as member" do
    sign_in @other_user
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
