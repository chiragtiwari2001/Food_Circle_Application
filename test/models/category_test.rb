require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  def setup
    image_file = fixture_file_upload('tmp/test.jpg', 'image/jpeg')

    @category = Category.new(category_name: 'Fast Food', category_image: image_file)
  end

  test 'should be valid' do
    assert @category.valid?
  end

  test 'Category name should be present' do
    @category.category_name = ''
    assert_not @category.valid?
  end
end
