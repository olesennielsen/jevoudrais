class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                    :token, :image_link, :cache_time, :cached_friends
  
  has_many :gifts, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           token:auth.token,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           image_link:auth.info.image,
                           cache_time:DateTime.now - 1.hour
                        )
      user.add_role :our_most_prized_user
      
      # Add birthday to users events
      Event.create(:name => "Birthday", :event_date => Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y'), :recurring => true, :user_id => user.id)
      
      # Take care of not insulting somebody by automatically detection if its Hanukka or Ramadan/eid, but for 
      # now christmas will do
      Event.create(:name => "Christmas", :event_date => Event.christmas_date(auth["info"]["location"]), :recurring => true, :user_id => user.id)      
    end
    
    events = user.events
    
    events.each do |event|
      if event.recurring
        unless event.event_date > Date.today
          if Date.new(Date.today.year, event.event_date.month, event.event_date.day) > Date.today
            event.update_attributes(:event_date => Date.new(Date.today.year, event.event_date.month, event.event_date.day))
          else
            event.update_attributes(:event_date => Date.new(Date.today.year + 1, event.event_date.month, event.event_date.day))
          end
        end 
      end
    end
    
    user.update_attributes(:token => auth["credentials"]["token"], :image_link => auth["info"]["image"])
    user
  end
  
  def self.get_giver(id)
    User.find(id).name
  end
  
  def get_notifications
    return Notification.where(:user_id => self.id)
  end  
end
