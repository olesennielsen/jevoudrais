class Gift < ActiveRecord::Base
  belongs_to :user
   
  attr_accessible :name, :giver_id, :user_id, :gift_template_id
  
  validates_presence_of :name
  

end
