class RemoveCompleteFromLecture < ActiveRecord::Migration[5.2]
  def change
    remove_column :lectures, :complete, :boolean
  end
end
