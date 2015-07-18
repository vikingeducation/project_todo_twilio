class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(white_list_params)
    if @todo.save
      flash[:notice] = "To do successfully created!"
      redirect_to @todo
    else
      flash[:notice] = "There was a problem saving your to do."
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(white_list_params)
      flash[:notice] = "To do successfully updated!"
      redirect_to @todo
    else
      flash[:notice] = "There was a problem saving your to do."
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "To do successfully deleted"
      redirect_to todos_path
    else
      flash[:notice] = "There was a problem deleting this to do"
      render :new
    end

  end

  private

  def white_list_params
    params.require(:todo).permit(:goal, :completion_date)
  end

end
