class Task < ActiveRecord::Base
  attr_accessible :code, :data
  has_many :jobs
end
