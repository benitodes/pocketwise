class CreateCompletedLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_levels do |t|
      t.references, :user_course
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
