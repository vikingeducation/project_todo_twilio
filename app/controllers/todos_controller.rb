class TodosController < ApplicationController
  def index
    @todos = Todo.order(:due)
  end
end
