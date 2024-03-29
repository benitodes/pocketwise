class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :kid, class_name: "User"
  has_many :completed_levels, dependent: :destroy
  has_many :levels, through: :completed_levels
end
