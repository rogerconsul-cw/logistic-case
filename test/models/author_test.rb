require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "should be valid with a name" do
    author = Author.new(name: "John Doe")
    assert author.valid?
  end

  test "should be invalid without a name" do
    author = Author.new(name: nil)
    assert_not author.valid?
  end

  test "should be invalid with a duplicate name" do
    Author.create(name: "John Doe")
    author = Author.new(name: "John Doe")
    assert_not author.valid?
  end
end
