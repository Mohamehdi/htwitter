class TweetsController < ApplicationController
	def new
		# Create a new instance of the class Tweet that we just created as a model
		@tweet = Tweet.new 
	end

	def create
		# This @tweet has no idea that the other @tweet in the othe action. THEY ARE DIFFRENT AND HAVE NOTHING TO DO WITH EACH OTHER!!!! 
		@tweet = Tweet.new(tweet_params)
		@tweet.save 
		render 'new'
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end
