class User < ActiveRecord::Base
	has_many :reviews
	has_many :comments
	has_many :ratings, through: :reviews, source: :ratings


  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
    	   :omniauth_providers => [:facebook, :twitter, :google_oauth2]



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

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
      if user
        return user
      else
        registered_user = User.where(:email => access_token.info.email).first
        if registered_user
          return registered_user
        else
          user = User.create(username: data["name"],
            provider:access_token.provider,
            email: data["email"],
            uid: access_token.uid ,
            password: Devise.friendly_token[0,20],
          )
        end
     end
  end

  def total_user_ratings
    ratings.sum(:rating)
  end

  def trusted_user
    total_user_ratings > 0 ? self.trusted = true : self.trusted = false
    save
  end
end
