module TasksHelper
  require 'erb'
  def javascript_task()
    renderer = ERB.new(@task.code.html_safe)
    renderer.result(binding).html_safe
  end
end
