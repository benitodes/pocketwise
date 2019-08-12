class Course < ApplicationRecord
  belongs_to :category
  belongs_to :wallet
  has_many :levels, dependent: :destroy
end
