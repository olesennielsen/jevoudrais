class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :friends, :birthday
  
  has_many :gifts, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  
  
  
  # The apply_omniauth method used to create the user, called from the omniauth callbacks controller
  def apply_facebook_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.name = omniauth['info']['name'] if name.blank?
    self.birthday = omniauth['extra']['raw_info']['birthday'] if birthday.blank?
    self.add_role :our_most_prized_user
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token => omniauth['credentials']['token'])
  end
  
end
