class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :code
      t.string  :data
      t.string  :data_file
      t.string  :output_file
      t.integer  :output
      t.integer :jobs
      t.boolean  :file
      t.timestamps
    end
  end
end
