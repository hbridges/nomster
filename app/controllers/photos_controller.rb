class PhotosController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_params.merge(:user => current_user))

		if @place.valid?
			redirect_to place_path(@place)
		else
			render :text => 'Please choose a picture', :status => :unprocessable_entity
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :picture)
	end

end
