require 'json'

# Read the JSON file from app/assets
file_path = Rails.root.join('app', 'assets', 'books.json')
books_json = File.read(file_path)

parsed_books = JSON.parse(books_json)["books"]

parsed_books.each do |book_data|
  author = Author.find_or_create_by(name: book_data["author"])
  book = Book.new(
    title: book_data["title"],
    isbn: book_data["isbn"],
    page_count: book_data["pages"],
    published_date: book_data["published"],
    publication_year: book_data["published"].to_date.year,
    author_id: author.id
  )
  book.save
end
