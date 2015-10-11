class ChangeCompletionName < ActiveRecord::Migration
  def change
  
    rename_column :todos, :completion, :due

  end
end
