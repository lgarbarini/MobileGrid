class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :data
      t.integer  :status
      t.integer :task_id
      t.integer :node_id
      t.timestamps
    end
  end
end
