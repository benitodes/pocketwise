class AddLastLevelToUserCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_courses, :last_level, :integer
  end
end
