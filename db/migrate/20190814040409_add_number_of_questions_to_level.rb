class AddNumberOfQuestionsToLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :number_of_questions, :integer
  end
end
