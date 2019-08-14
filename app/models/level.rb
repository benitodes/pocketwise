class Level < ApplicationRecord
  belongs_to :course
  has_many :lectures, dependent: :destroy
  has_many :questions, dependent: :destroy
  validates :name, :number, :complete, presence: true
end
