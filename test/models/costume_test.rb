require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  # Validation tests
  test "Costume should only be saved with name, category, size, description and price" do
    costume = Costume.new
    assert_not costume.save, "Saved the costume without a name"
  end

  test "Costume description and name should be at least 5 characters long" do
    costume = Costume.new(name: "a", description: "a")
    assert_not costume.save, "Description and name are too short"
  end

  test "Costume price should be greater than 0" do
    costume = Costume.new(price_per_day: -1)
    assert_not costume.save, "Price is less than 0"
  end

  test "Costume category should be one of the predefined categories" do
    costume = Costume.new(category: "not_in_the_list")
    assert_not costume.save, "Category is not in the predefined list"
  end

  test "Costume size should be one of the predefined sizes" do
    costume = Costume.new(size: "SS")
    assert_not costume.save, "Size is not in the predefined list"
  end

  test "Costume name should not be longer than 30 characters" do
    costume = Costume.new(name: "a superlong costume name that actually should be short and consice")
    assert_not costume.save, "Name is too long"
  end
end
