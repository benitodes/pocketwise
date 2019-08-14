class RemoveCompleteFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :complete, :boolean
  end
end
