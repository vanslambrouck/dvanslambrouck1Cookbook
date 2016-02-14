require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @recipe1 = recipes(:one)
    @recipe2 = recipes(:two)
    @category = categories(:one)
  end
  
  test "should have many recipes" do
    @category.recipes << @recipe1
    @category.recipes << @recipe2
    assert_equal( 2, @category.recipes.count, "count doesn't equal 2")
  end
end
