class FollowsController < ApplicationController
	def create 
		@user = User.find(params[:follows][:user])
		# follow the current user as per the github page
		current_user.follow(@user)
		redirect_to tweets_path
	end 
end
