class Friend < ActiveRecord::Base
	geocoded_by :get_location
	before_save :geocode

	def self.get_friend_data(friend, location_value, user_id)
		self.create_with(
			name: friend.name,
			screen_name: friend.screen_name,
			location: friend.location,
			latitude: location_value.first,
			longitude: location_value.second,
			user_id: user_id
			).find_or_create_by(user_id: user_id, screen_name: friend.screen_name)
	end

	def get_location
		self.location
	end
end
