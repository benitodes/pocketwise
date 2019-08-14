class Goal < ApplicationRecord
  belongs_to :wallet
  validates :name, :goal_allowance, :goal_price, presence: true
end
