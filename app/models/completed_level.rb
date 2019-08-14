class CompletedLevel < ApplicationRecord
  belongs_to :user_course
  belongs_to :level
end
