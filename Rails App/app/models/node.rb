class Node < ActiveRecord::Base
  belongs_to :job
  # attr_accessible :title, :body
end
