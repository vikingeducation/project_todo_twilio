class FavoritesController < ApplicationController

  before_action :set_task, only: [:update, :destroy]
  before_action :require_admin

  def update
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
