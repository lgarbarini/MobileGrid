module JobsHelper
  require 'erb'
  def javascript_task()
    data = @job.data
    renderer = ERB.new(@task.code.html_safe)
    renderer.result(binding).html_safe
  end
end
