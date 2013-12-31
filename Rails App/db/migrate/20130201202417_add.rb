class Add < ActiveRecord::Migration
  change_table :jobs do |t|
    t.integer :failcount, :null => false, :default => 0
  end
end
