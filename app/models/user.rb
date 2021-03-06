class User < ActiveRecord::Base
	has_many :friends

	def self.create_with_omniauth(auth)
		location = auth['info']['location'] || ''
		user_location = Geocoder.coordinates(location)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"] || ''
			user.address = auth['info']['location'] || ''
			user.avatar = auth["info"]["image"] || ''
			user.oauth_token = auth["credentials"]["token"] || ''
			user.oauth_secret = auth["credentials"]["secret"] || ''
			user.latitude = user_location.first if user_location.present?
			user.longitude = user_location.second if user_location.present?
		end
	end
end
