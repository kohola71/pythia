class User < ActiveRecord::Base
  has_many :questions
  has_many :possible_answers

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def friends
    # koala = Koala::Facebook::OAuth.new('165852203609311', '49ebd0951251555ad8df8697c4686fef')
    # new_token = koala.exchange_access_token_info(oauth_token)
    # graph = Koala::Facebook::GraphAPI.new(new_token)
    # graph.get_connections("me", "friends")
     if oauth_token
      graph = Koala::Facebook::GraphAPI.new(oauth_token)
      graph.get_connections("me", "friends")
      else
      []
    end

  end
end



