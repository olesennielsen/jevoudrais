class Event < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :event_date, :name, :recurring, :user_id
  
  def self.christmas_date(location)
    puts location    
  end
end
