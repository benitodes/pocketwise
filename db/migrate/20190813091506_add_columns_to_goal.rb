class AddColumnsToGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :name, :string
    add_column :goals, :picture, :string
  end
end
