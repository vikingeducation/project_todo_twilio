class ChangeDescriptionAndCompletionInTodos < ActiveRecord::Migration
  def change
    change_column :todos, :description, :string
    change_column :todos, :completion, :datetime
  end
end
