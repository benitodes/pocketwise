class RemoveCompleteFromLevel < ActiveRecord::Migration[5.2]
  def change
    remove_column :levels, :complete, :boolean
  end
end
