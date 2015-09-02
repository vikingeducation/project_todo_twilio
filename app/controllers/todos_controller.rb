class TodosController < ApplicationController
  #DateTime.parse("09/01/2015 2:56 PM").strftime("%m/%d/%Y %H:%M %p")
  def index 
    #Todo.order(:timedate)
    @todos = Todo.order(:timedate).all
  end
  
  def new
    @todo = Todo.new
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, :notice => "you event has been saved"
    else
      render "new"
    end
  end
  
  def update
    @todo = Todo.find(params[:id])
    
    if @todo.update_attributes(todo_params)
      redirect_to todos_path, :notice => "you event has been edited"
    else
      render "edit"
    end
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, :notice => "you event has been deleted"
  end
  
  def todo_params
    params.require(:todo).permit(:id, :event, :note, :timedate)
  end
end
