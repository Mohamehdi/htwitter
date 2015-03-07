class TweetsController < ApplicationController
	
	# To make sure the user is signed in first! 
	before_action :authenticate_user!

	def new
		# Create a new instance of the class Tweet that we just created as a model
		@tweet = Tweet.new 
	end

	def create
		# This @tweet has no idea that the other @tweet in the othe action. THEY ARE DIFFRENT AND HAVE NOTHING TO DO WITH EACH OTHER!!!! 
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "You have created a tweet!"
			# render vs redirect ? 
			redirect_to new_tweet_path
		end
		@tweet.save 
		# render 'new'
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

	def index 
		@tweets = Tweet.all
	end

end
