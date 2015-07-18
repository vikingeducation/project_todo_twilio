class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    @user.save
    redirect_to user_tasks
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :crypted_password, :salt)
  end
end
