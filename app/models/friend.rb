class Friend < ActiveRecord::Base

	def self.get_friend_data(friend, location_value, user_id)
		self.where(
			name: friend.name,
			screen_name: friend.screen_name,
			location: friend.location,
			user_id: user_id
			).first_or_create
	end
end
