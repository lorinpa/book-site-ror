class Book < ActiveRecord::Base
    belongs_to :author
    has_many :reviews, :dependent => :destroy
    has_many :book_categories, :dependent => :destroy
    validates :title, presence: true
    validates :author_id, presence: true, numericality: {only_integer: true}
end
