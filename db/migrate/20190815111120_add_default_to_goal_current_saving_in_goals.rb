class AddDefaultToGoalCurrentSavingInGoals < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :goal_current_saving, :integer, default: 0
    change_column :goals, :complete, :boolean, default: false
  end
end
