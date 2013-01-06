class HomeController < ApplicationController
  def index
    @gifts = current_user.gifts.order(:name)
  end
  
  def new
    
  end
end
