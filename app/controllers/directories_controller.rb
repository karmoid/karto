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
			@directory = @directory.directories.build
		end	
	end

	def create
		directory_id = params[:directory_id] || -1
		@directory = Directory.find(directory_id)
		if @directory.nil?
			@directory = Directory.build(params[:directory])
		else
			@directory = @directory.directories.build(params[:directory])
		end	
		respond_to do |format|
    		if @directory.save
      			format.html  { redirect_to(@directory.parent, :notice => 'Directory was successfully created.') }
    		else
      			format.html  { render :action => "new" }
    		end			
		end	
	end

	def edit
	end

	def update
	end
end
