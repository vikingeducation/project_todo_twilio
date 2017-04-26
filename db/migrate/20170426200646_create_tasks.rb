class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :category
      t.text :description
      t.string :due_date

      t.timestamps
    end
  end
end
