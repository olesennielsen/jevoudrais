class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts
    @notifications = current_user.notifications.where(:seen => false)
    # caching for 15 minutes
    if ((current_user.cache_time + 15.minutes) < DateTime.now) or current_user.cached_friends.empty?
      token = current_user.token
      user = FbGraph::User.me(token)
      @friends = user.friends
      @friends.collect!{ |friend| friend.identifier }
      @users = User.where(:uid => @friends)
      current_user.update_attributes(:cached_friends => @users.collect { |user| user.id }.join(","), :cache_time => DateTime.now)
    else
      users_string = current_user.cached_friends.split(",")
      users_string.collect! { |user| user.to_i }
      @users = User.where(:id => users_string)
    end
    
    @own_events = current_user.events
    
    @events = []
    
    @users.each do |user|
      tmp_events = user.events
      
      tmp_events.each do |event|
        @events.push(event)
      end
    end
  
    @events.sort_by! { |e| e.event_date }    
  end
  
  def new
    
  end
end
