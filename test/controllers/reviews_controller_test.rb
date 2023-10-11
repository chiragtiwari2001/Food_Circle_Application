require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @review = reviews(:hello)
    @restaurant = restaurants(:gurukripa)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Review.count' do
      post restaurant_reviews_path(@restaurant), params: {review: {content: "Welcome" } }
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Review.count' do
      delete restaurant_review_path(@restaurant, @review)
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy for wrong review" do
    sign_in users(:michael)
    review = reviews(:hello)
    assert_no_difference 'Review.count' do
      delete restaurant_review_path(@restaurant, @review)
    end
    assert_redirected_to root_url
  end
end
