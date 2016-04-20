class User < ActiveRecord::Base
	has_many :reviews
	has_many :comments
	has_many :ratings


  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
    	   :omniauth_providers => [:facebook, :twitter]



  attr_accessor :login

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      if !user.email
        user.email = SecureRandom.base64
      end
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end


  def total_average_rating

  end
end
