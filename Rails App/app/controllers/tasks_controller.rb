class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end
  
  def index
    @tasks = Task.all
  end
  
  def load
    @task = Task.find(params[:id])
  end
  
  def new
    @task = task.new
  end
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "task updated."
      redirect_to @task
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task Deleted."
    render "index"
  end
end
