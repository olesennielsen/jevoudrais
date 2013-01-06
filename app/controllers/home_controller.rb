class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts
    
    token = current_user.token
    
    user = FbGraph::User.me(token)
    @friends = user.friends
    
    @emails = []
    
    @friends.each do |f|
      friend = FbGraph::User.fetch(f.identifier, :access_token => token)
      @emails.push(friend)
    end
    
    # @friends.collect { |friend| friend.email }  
    
  end
  
  def new
    
  end
end
