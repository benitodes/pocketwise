class AddNumberToLecture < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :number, :integer
  end
end