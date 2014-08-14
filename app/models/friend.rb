class Friend < ActiveRecord::Base
	belongs_to :user

	def self.get_friend_data(friend, location_value, user_id)
		self.create_with(
			name: friend.name,
			avatar: friend.profile_image_url.to_s,
			screen_name: friend.screen_name,
			location: friend.location,
			latitude: location_value.first + rand(0..0.05000),
			longitude: location_value.second + rand(0..0.05000),
			user_id: user_id
			).find_or_create_by(user_id: user_id, screen_name: friend.screen_name)
	end

	def self.get_marker_data(screen_name, name, location)
		"<span class='friend-info'><strong>@#{screen_name}</strong><br>#{name}<br>#{location}<span>"
	end
end
