class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :body
      t.references :user
      t.boolean :seen, :default => false

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
