class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :table
      t.string :table_id
      t.string :action
      t.string :old_value, :default=>''
      t.string :new_value, :default=>''
      t.text :comments, :default=>''
      t.integer :user_id, :default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end