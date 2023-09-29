class Book < ApplicationRecord
  belongs_to :author
  validates :title, :author, :year, presence: true
  
end
