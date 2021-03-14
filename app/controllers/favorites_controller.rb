class FavoritesController < ApplicationController

  before_action :set_task, only: [:create, :destroy]
  before_action :require_admin

  def create
    @task.favorite!
  end

  def destroy
    @task.unfavorite!
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

end
