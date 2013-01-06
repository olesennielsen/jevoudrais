class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts
    
    token = current_user.token
    
    user = FbGraph::User.me(token)
    @friends = user.friends
    
    @friends.collect!{ |friend| friend.identifier }
    
    @users = User.where(:uid => @friends) 
    
  end
  
  def new
    
  end
end
