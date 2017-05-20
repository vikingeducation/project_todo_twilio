class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :task
    	t.string :description
    	t.time :time_to_be_completed

      t.timestamps null: false
    end
  end
end
