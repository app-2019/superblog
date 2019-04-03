class Author < ApplicationRecord
  has_many :posts
  validates :uid, uniqueness: true
end
