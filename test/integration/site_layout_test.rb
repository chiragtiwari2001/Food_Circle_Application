require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'home_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path, count: 0
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
