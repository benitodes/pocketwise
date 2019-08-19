class Goal < ApplicationRecord
  belongs_to :wallet
  mount_uploader :picture, PhotoUploader
  validates :name, :goal_allowance, :goal_price, presence: true

  before_validation :verify_goal_allowance

  def verify_goal_allowance
    if self.goal_allowance > self.goal_price || self.goal_allowance > wallet.total_allowance
      errors.add(:goal_allowance, "is too high!")
    end
  end
end
