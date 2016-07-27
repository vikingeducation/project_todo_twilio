class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :completion_date
      t.boolean :completed?, :default => false

      t.timestamps null: false
    end
  end
end
