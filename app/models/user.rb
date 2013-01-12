class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :birthday, :provider, :uid, :token, :image_link
  
  has_many :gifts, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :events, :dependent => :destroy
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           token:auth.token,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           image_link:auth.info.image
                           )
      user.add_role :our_most_prized_user
      Event.create(:name => "Birthday", :event_date => Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y'), :recurring => true, :user_id => user.id)
      
      # Take care of not insulting somebody by automatically detection if its Hanukka or Ramadan, but for 
      # now christmas will do
      Event.create(:name => "Christmas", :event_date => Event.christmas_date(auth["info"]["location"]), :recurring => true, :user_id => user.id)      
    end
    user.update_attributes(:token => auth["credentials"]["token"], :image_link => auth["info"]["image"])
    user
  end  
end
