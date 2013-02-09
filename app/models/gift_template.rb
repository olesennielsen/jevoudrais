class GiftTemplate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :image_link, :name, :product_link, :user_id
  
  def self.get_gift_template(id)
    GiftTemplate.find(id)
  end
end
