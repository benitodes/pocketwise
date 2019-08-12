class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.boolean :complete
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
