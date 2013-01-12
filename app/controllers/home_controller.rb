class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts
    
    token = current_user.token
    
    user = FbGraph::User.me(token)
    @friends = user.friends
    
    @friends.collect!{ |friend| friend.identifier }
    
    @users = User.where(:uid => @friends)
    
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
