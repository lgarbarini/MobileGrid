class Job < ActiveRecord::Base
  belongs_to :task
  # attr_accessible :title, :body
end
