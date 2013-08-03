class Review < ActiveRecord::Base
    belongs_to :book
    validates :stars, numericality: {:greater_than_or_equal_to => 0 ,only_integer: true ,
    :less_than_or_equal_to => 5,
    message: "%{value} is not a valid number" }
    validates :book_id, presence: true, numericality: {only_integer: true}
    validates :body, presence: true
end
