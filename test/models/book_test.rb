require "test_helper"

class BookTest < ActiveSupport::TestCase
  setup do
    @author = authors(:one)  # assuming you have a fixture for authors
  end

  test "should be valid with a title, author, and publication_year" do
    book = Book.new(title: "Sample Title", author: @author, publication_year: 2022)
    assert book.valid?
  end

  test "should be invalid without a title" do
    book = Book.new(title: nil, author: @author, publication_year: 2022)
    assert_not book.valid?
  end

  test "should be invalid without an author" do
    book = Book.new(title: "Sample Title", author:
