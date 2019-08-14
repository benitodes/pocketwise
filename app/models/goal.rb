class Goal < ApplicationRecord
  belongs_to :wallet
  mount_uploader :picture, PhotoUploader
  validates :name, :goal_allowance, :goal_price, presence: true
end
