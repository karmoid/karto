class DirectoriesController < ApplicationController
	def show
		directory_id = params[:id]
		@directory = Directory.find(directory_id)
	end

	def new
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		if @directory.nil?
			@directory = Directory.new
		else
			@directory = Directory.directories.build
		end	
	end

	def create
		directory_id = params[:directory_id] || -1
		@directory = Directory.find(directory_id)
		if @directory.nil?
			@directory = Directory.new(params[:directory])
		else
			@directory = Directory.directories.build(params[:directory])
		end	
	end

	def edit
	end

	def update
	end
end
