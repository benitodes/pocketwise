class RemoveCompleteFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :complete, :boolean
  end
end
