class Author < ActiveRecord::Base
    has_many :books, :dependent => :destroy
    validates :first_name, presence: true
    validates :last_name, presence: true
end
