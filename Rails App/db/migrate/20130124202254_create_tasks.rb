class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text  :code
      t.string  :data
      t.text  :data_file
      t.text  :output_file
      t.string  :output
      t.integer :jobs
      t.boolean  :file
      t.timestamps
    end
  end
end
