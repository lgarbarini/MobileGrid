class ReduceWorker
  include Sidekiq::Worker
  def perform(task)
    j = Job.where(:task_id =>task)
    if j.where(:status =>2).count == j.count
      s=0
      j.each do |n|
        p=Job.find(n)
        s=p.result.to_f+s.to_f
      end
      t=Task.find(task)
      t.output=s.to_s
      t.save
    else
      t=Task.find(task)
      t.output="Error"
      t.save
    end
  end
end