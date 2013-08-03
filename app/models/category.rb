class Category < ActiveRecord::Base
    has_many :book_categories, :dependent => :destroy
    validates :title, presence: true
end
