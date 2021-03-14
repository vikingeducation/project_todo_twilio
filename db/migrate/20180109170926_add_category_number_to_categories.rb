class AddCategoryNumberToCategories < ActiveRecord::Migration[5.0]
  def up
    add_column :categories, :category_number, :integer

    Category.all.each do |c|
      c.category_number = c.id + 10
      c.save
    end

  end

  def down
    remove_column :categories, :category_number
  end
end
