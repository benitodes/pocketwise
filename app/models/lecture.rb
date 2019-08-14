class Lecture < ApplicationRecord
  belongs_to :level
  validates :title, :description, presence: true
end
