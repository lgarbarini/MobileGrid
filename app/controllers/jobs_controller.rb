class JobsController < ApplicationController
  def new
      @job = Job.new
    render :layout => "application"
  end

  def index
    @job = Job.all
    @title = "job list"
  end

  def get
    @job = Job.where(:status => "0").first
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def update
    @node = Node.find(params[:nodesession_id])
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      @job.status = "2"
      redirect_to "#"
    else
      @job.status = "0"
      @node.fail_count = @node.fail_count + 1
    end
  end
end
