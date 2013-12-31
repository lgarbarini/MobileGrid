class JobsController < ApplicationController
  respond_to :html, :json, :js
  def index
    @task = task.find(params[:task_id])
    @active_jobs = @task.jobs.where(:status => "1")
    @complete_jobs = @task.jobs.where(:status => "2")
    @title = "job list"
  end
  
  def get
    if Job.where("status =? AND task_id = ?", 0, params[:task_id]).first.present?
      @job = Job.where("status =? AND task_id = ?", 0, params[:task_id]).first
      respond_to do |format|
         format.json { render json: @job }
      end
      @job.status = "1"
      @job.updated_at = Time.now
      @job.save
      JobWorker.perform_async(@job.id)
    else
      render :json => {}
      ReduceWorker.perform_async(params[:task_id])
    end
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def reset
    @job = Job.find(params[:id])
      @job.success = false
      @job.status = "0"
      @job.save
    render :json => {}
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      if @job.error == 0
        @job.status = "2"
        @job.success = true
        @job.save
      else
        @job.success = false
        @job.status = "0"
        @job.save
      end
      render :json => {}
    else
      @job.status = "0"
    end
  end
end
