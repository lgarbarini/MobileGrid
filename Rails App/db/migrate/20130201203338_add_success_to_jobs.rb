class AddSuccessToJobs < ActiveRecord::Migration
  change_table :jobs do |t|
    t.boolean :success, :default => 0
  end
end
