class Lecture < ApplicationRecord
  belongs_to :level
  validates :title, :description, :complete, presence: true
end
