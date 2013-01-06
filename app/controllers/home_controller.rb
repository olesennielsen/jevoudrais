class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts
  end
  
  def new
    
  end
end
