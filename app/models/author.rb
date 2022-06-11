class Author < ApplicationRecord
  has_many :posts

  validates :phone_number, length: { is: 8 }
end
