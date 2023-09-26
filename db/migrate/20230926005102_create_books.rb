class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.integer :page_count
      t.datetime :published_date
      t.string :thumbnail_url
      t.text :short_description
      t.text :long_description
      t.string :status
      t.references :author, null: false, foreign_key: true
      t.integer :publication_year

      t.timestamps
    end
  end
end
