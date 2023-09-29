require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @author = authors(:one)
  end

  test "should create book" do
    @author = authors(:one)
    assert_difference('Book.count') do
      post books_url, params: { book: { title: "New Book", pages: 100, image_link: "link", year: 1999, author_name: @author.name } }
    end
    assert_redirected_to book_url(Book.last)
  end

  test "should create book and new author" do
    assert_difference('Book.count') do
      assert_difference('Author.count', 1) do
        post books_url, params: { book: { title: "Another New Book", pages: 200, image_link: "another_link", year: 1999, author_name: "New Author" } }
      end
    end
    assert_redirected_to book_url(Book.last)
  end

  test "should update book" do
    patch book_url(@book), params: { book: { title: "Updated Title", pages: 101, author_name: "Existing Author" } }
    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
  end
end
