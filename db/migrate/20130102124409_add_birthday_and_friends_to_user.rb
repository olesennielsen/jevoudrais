class AddBirthdayAndFriendsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :friends, :text
  end
end
