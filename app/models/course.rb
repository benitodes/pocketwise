class Course < ApplicationRecord
  belongs_to :category
  has_many :levels, dependent: :destroy
#  validates :name, :description, presence: true
end
