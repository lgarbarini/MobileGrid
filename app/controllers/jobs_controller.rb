class JobsController < ApplicationController
  def index
    @task = task.find(params[:task_id])
    @active_jobs = @task.jobs.where(:status => "1")
    @complete_jobs = @task.jobs.where(:status => "2")
    @title = "job list"
  end

  def get
    @job = Job.where(:status => "0").first
    @task = Task.find(@job.task_id)
    @job.status = "1"
    @job.save
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
##    @node = Node.find(params[:node_session_id])
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      if @job.error == 0
        @job.status = "2"
        @job.save
      else
        @job.status = "0"
        @job.save
      end
      render :json => {}
    else
      @job.status = "0"
##      @node.fail_count = @node.fail_count + 1
    end
  end
end
