class AddReferenceToUsers < ActiveRecord::Migration
  def change
    add_column :todos, :user_id, :reference
  end
end
