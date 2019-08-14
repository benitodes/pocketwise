class Level < ApplicationRecord
  belongs_to :course
  has_many :lectures, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :completed_levels
  validates :name, :number, presence: true
end
