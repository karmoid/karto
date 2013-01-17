class WelcomeController < ApplicationController
	def index
  		@directory = Directory.first
		@favs = []
		@pins = []
		@favs << Directory.where(:fav => true)
		@pins << Directory.where(:pin => true)
		@favs << ActiveRecord::Base::Collector.where(:fav => true)
		@pins << ActiveRecord::Base::Collector.where(:pin => true)
		@favs << Leaf.where(:fav => true)
		@pins << Leaf.where(:pin => true)
	end
end
