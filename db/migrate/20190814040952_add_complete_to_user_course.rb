class AddCompleteToUserCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :user_courses, :complete, :boolean
  end
end
