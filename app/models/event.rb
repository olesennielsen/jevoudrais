class Event < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :event_date, :name, :recurring, :user_id
  
  def self.christmas_date(location)
    return Date.new(2013, 12, 24)    
  end
end
