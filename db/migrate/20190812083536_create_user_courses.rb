class CreateUserCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_courses do |t|
      t.references :course, foreign_key: true
      t.references :kid, foreign_key: true, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
