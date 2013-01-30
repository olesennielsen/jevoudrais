class GiftTemplate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :image_link, :name, :product_link, :user_id
end
