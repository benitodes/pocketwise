class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.boolean :complete
      t.string :picture
      t.references :category, foreign_key: true
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
