json.extract! book, :id, :title, :pages, :published_date, :image_link, :short_description, :long_description, :status, :author_id, :publication_year, :created_at, :updated_at
json.url book_url(book, format: :json)
json.author_name book.author.name
