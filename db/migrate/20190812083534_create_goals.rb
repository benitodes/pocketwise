class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :goal_allowance
      t.integer :goal_price
      t.integer :goal_current_saving
      t.boolean :complete
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
