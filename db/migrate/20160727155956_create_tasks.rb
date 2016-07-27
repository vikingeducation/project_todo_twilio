class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.date :completion_date

      t.timestamps null: false
    end
  end
end
