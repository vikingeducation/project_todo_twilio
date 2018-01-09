class CategoriesController < ApplicationController

  before_action :require_admin

  def index
    @categories = Category.all.order(category_number: :ASC)
  end

end
