class MapDisplayController < ApplicationController
  def index
  	@markers = []
  	@friends = current_user.friends
  	@friends.each do |f|
  		marker_data = get_marker_data(f.screen_name, f.name)
  		@markers << [marker_data, f.latitude, f.longitude]
  	end
  end
end
