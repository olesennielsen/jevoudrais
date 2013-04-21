class GiftTemplate < ActiveRecord::Base
  belongs_to :gift_creator
  has_many :clicks
  attr_accessible :image_link, :name, :product_link, :gift_creator_id

  def self.get_gift_template(id)
    GiftTemplate.find(id)
  end
end
