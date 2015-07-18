class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(white_list_user_params)
    if @user.save
      flash[:notice] = "Creation successful!"
      redirect_to @user
    else
      flash[:notice] = "Creation failed, please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @todos = Todo.where(user_id: params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(white_list_user_params)
      flash[:notice] = "Updating successful!"
      redirect_to @user
    else
      flash[:notice] = "Updating failed, please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(white_list_user_params)
      flash[:notice] = "Deletion successful!"
      redirect_to users_path
    else
      flash[:notice] = "Deletion failed, please try again."
      render :destroy
    end
  end

  private
    def white_list_user_params
      params.require(:user).permit(:name, :number)
    end
end
