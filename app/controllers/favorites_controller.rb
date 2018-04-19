class FavoritesController < ApplicationController

  before_action :set_task, only: [:update, :destroy]
  before_action :require_admin

  def update
    @task.favorite!
    redirect_to tasks_url

  end

  def destroy
    @task.unfavorite!
    redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

end
