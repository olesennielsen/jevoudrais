class AddCacheTimeAndCachedFriends < ActiveRecord::Migration
  def change
    add_column :users, :cache_time, :datetime
    add_column :users, :cached_friends, :text
  end
end
