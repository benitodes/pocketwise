class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :kid, class_name: "User"
end
