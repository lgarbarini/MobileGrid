class AddResultsToJobs < ActiveRecord::Migration
  change_table :jobs do |t|
    t.string :result
  end
end
