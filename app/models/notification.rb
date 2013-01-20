class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :seen, :user_id
end
