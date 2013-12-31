class Job < ActiveRecord::Base
##  belongs_to :task
##  serialize :data, :result
  attr_accessible :data, :status, :error, :status, :result
end
