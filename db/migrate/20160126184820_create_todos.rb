class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
       t.string  :text
       t.date    :date 
      t.timestamps null: false
    end
  end
end
