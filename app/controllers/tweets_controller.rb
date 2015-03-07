class TweetsController < ApplicationController
	def new
		# Create a new instance of the class Tweet that we just created as a model
		@tweet = Tweet.new 
	end
end
