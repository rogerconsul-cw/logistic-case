require 'json'

# Read the JSON file from app/assets
file_path = Rails.root.join('app', 'assets', 'books.json')
books_json = File.read(file_path)

parsed_books = JSON.parse(books_json)

parsed_books.each do |book_data|
  author = Author.find_or_create_by(name: book_data["author"])
  book = Book.new(
    title: book_data["title"],
    pages: book_data["pages"],
    year: book_data["year"],
    country: book_data["country"],
    language: book_data["language"],
    image_link: book_data["imageLink"],
    link: book_data["link"],
    author_id: author.id
  )
  book.save
end
