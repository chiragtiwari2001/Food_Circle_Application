require "test_helper"

class RestaurantMailerTest < ActionMailer::TestCase
  test "order_confirmation" do
    mail = RestaurantMailer.order_confirmation
    assert_equal "Order confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
