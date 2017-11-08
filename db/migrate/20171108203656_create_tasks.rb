class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.integer :point_value
      t.date :completed_on

      t.timestamps
    end
  end
end
