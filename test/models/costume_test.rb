require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  # Validation tests
  setup do
    @user = users(:one)
  end

  test "Costume should only be saved with name, category, size, description and price" do
    costume = Costume.new(user_id: @user.id)
    assert_not costume.save, "Cannot save costume without a name"
  end

  test "Costume description and name should be at least 5 characters long" do
    costume = Costume.new(user_id: @user.id, name: "a", description: "a")
    assert_not costume.save, "Description and name are too short"
  end

  test "Costume price should be greater than 0" do
    costume = Costume.new(user_id: @user.id, price_per_day: -1)
    assert_not costume.save, "Price can't be less than 0"
  end

  test "Costume category should be one of the predefined categories" do
    costume = Costume.new(user_id: @user.id, category: "not_in_the_list")
    assert_not costume.save, "Category is not in the CATEGORY array"
  end

  test "Costume size should be one of the predefined sizes" do
    costume = Costume.new(user_id: @user.id, size: "SS")
    assert_not costume.save, "Size is not in the SIZES array"
  end

  test "Costume name should not be longer than 30 characters" do
    costume = Costume.new(user_id: @user.id, name: "a superlong costume name that actually should be short and consice")
    assert_not costume.save, "Name can't be longer than 30 characters"
  end
end
