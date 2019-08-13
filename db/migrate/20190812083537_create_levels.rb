class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :number
      t.boolean :complete
      t.string :picture
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
