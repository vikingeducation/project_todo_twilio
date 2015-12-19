class TodosController < ApplicationController
  def index
    @todos = Todo.order(:due)
    @todo = Todo.new
  end
end
