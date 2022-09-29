class Genre < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :comments, through: :movies
end
