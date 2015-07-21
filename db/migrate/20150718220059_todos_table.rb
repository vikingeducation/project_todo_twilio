class TodosTable < ActiveRecord::Migration
    create_table :todos do |t|
      t.string :goal
      t.datetime :completion_date
      t.references :user
      t.timestamps null: false
    end
end
