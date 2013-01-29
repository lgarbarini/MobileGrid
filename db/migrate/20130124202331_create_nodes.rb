class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string  :device
      t.integer :job_id
      t.timestamps
    end
  end
end
