class RefactorBooksTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :isbn, :string
    remove_column :books, :page_count, :integer
    remove_column :books, :published_date, :datetime
    remove_column :books, :thumbnail_url, :string
    remove_column :books, :short_description, :text
    remove_column :books, :long_description, :text
    remove_column :books, :status, :string
    remove_column :books, :publication_year, :integer

    add_column :books, :country, :string
    add_column :books, :language, :string
    add_column :books, :image_link, :string
    add_column :books, :link, :string
    add_column :books, :pages, :integer
    add_column :books, :year, :integer
  end
end
