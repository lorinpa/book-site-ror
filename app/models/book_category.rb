class BookCategory < ActiveRecord::Base
  belongs_to :book
  belongs_to :category
  validates :book_id, presence: true, numericality: {only_integer: true}
  validates :category_id, presence: true, numericality: {only_integer: true}
end
