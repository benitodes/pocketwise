class AddLastQuestionToUserCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_courses, :last_question, :integer
  end
end
