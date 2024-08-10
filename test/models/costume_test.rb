require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  test "Costume should not be saved without a name" do
    costume = Costume.new
    assert_not costume.save, "Saved the costume without a name"
    costume.valid?
    puts costume.errors.full_messages
  end
end
