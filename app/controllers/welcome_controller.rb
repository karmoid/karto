class WelcomeController < ApplicationController
	def index
  		@directory = Directory.find_by_name("root")
		@favs = []
		@pins = []
		@favs << Directory.where(:fav => true)
		@pins << Directory.where(:pin => true)
		@favs << Lasso.where(:fav => true)
		@pins << Lasso.where(:pin => true)
		@favs << Leaf.where(:fav => true)
		@pins << Leaf.where(:pin => true)
	end
end
