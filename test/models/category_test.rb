require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid?
  end

  test "name shouldn't be so short, minimum 3 characters" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "name shouldn't be so long maximum 12 characters" do
    @category.name = "1234567891234567"
    assert_not @category.valid?
  end

end
