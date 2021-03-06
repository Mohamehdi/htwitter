class ProfilesController < ApplicationController
	
	before_action :authenticate_user!

	def new 
		@profile = Profile.new
	end

	def create 
		@profile = Profile.new(profile_params)
		@profile.user = current_user
		if @profile.save
			flash[:success] = "You have created a profile! :D"
			# render vs redirect ? 
			redirect_to profile_path(current_user.profile)
		else 
			# redirect_to new_tweet_path
			# YOU CAN'T SAY REDIRECT HERE BECAUSE WE NEED TO KEEP TRACK OF THE @TWEET EVEN IT'S LONG SO THAT THE USER 
			# DOESN'T HAVE TO TYPE EVERYTHING ALL OVER AGAIN
			render 'new'
		end
	end 

	def profile_params
		params.require(:profile).permit(:description, :first_name, :picture)
	end 

	# It's a part of resources 
	def show 
		@profile = Profile.find(params[:id])
	end

end
