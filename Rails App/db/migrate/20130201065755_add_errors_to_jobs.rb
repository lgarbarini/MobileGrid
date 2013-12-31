class AddErrorsToJobs < ActiveRecord::Migration
  change_table :jobs do |t|
    t.integer :error
  end
end
