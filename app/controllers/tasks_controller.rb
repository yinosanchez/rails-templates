class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def new
    @users = User.all
  end

  def create
    @task = Task.new(params.permit(:title, :description, :user))
    @task.done = false
    if @task.save
      redirect_to '/tasks/index'
    else
      @users = User.all
      render 'new'
    end
  end

  def toggle
    @task = Task.find_by id: params[:id]
    if @task.done
      @task.done = false
    else
      @task.done = true
    end
    @task.save
    render partial: 'task', layout: false, locals: {task: @task}
  end

  def destroy
    @task = Task.find_by id: params[:id]
    @task.destroy
    render json: @task
  end
end
