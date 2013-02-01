class Job < ActiveRecord::Base
  belongs_to :task
  attr_accessible :data, :status, :error
end
