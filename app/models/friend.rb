class Friend < ActiveRecord::Base
	geocoded_by :get_location
	before_save :geocode

	def self.get_friend_data(friend, user_id)
		unless friend.location.nil?
			self.create_with(
				name: friend.name,
				screen_name: friend.screen_name,
				location: friend.location,
				user_id: user_id
				).find_or_create_by(user_id: user_id, screen_name: friend.screen_name)
		end
	end

	def get_location
		self.location
	end
end
