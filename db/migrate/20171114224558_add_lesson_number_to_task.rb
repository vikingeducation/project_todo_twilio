class AddLessonNumberToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :lesson_number, :integer

    Task.all.each do |task|
      task.lesson_number = task.id * 10
      task.save
    end
  end
end
