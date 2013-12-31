class JobWorker
  include Sidekiq::Worker
  
  def perform(job_id)
    sleep(200)
    job = Job.find(job_id)
    if job.status == 1
      if job.success == false
        job.failcount = job.failcount+1
        job.status = 0
        job.save
      else
        job.status = 2
        job.save
      end
    end
  end
end