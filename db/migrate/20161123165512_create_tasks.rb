class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.text :additional
      t.datetime :due

#default: false
#rails g migration AddSoftDeleteToTask default:false 
      t.timestamps
    end
  end
end
