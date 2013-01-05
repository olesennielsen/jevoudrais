class Gift < ActiveRecord::Base
  belongs_to :user
   
  attr_accessible :name, :giver_id, :receiver
end
