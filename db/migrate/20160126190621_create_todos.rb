class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.datetime :date
      t.timestamps null: false
    end
  end
end
