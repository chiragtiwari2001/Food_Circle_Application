require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in @user = users(:john)
    @category = categories(:Italian)
  end
end
