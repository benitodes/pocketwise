class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question_content
      t.boolean :complete
      t.text :hint
      t.string :picture
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
