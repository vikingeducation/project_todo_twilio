class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :due_date
      t.string :category
      t.integer :priority

      t.timestamps null: false
    end
  end
end
