class LeafsController < ApplicationController
	def show
		leaf_id = params[:id]
		@leaf = Leaf.find(leaf_id)
	end

	def new
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@leaf = @directory.leafs.build
		end	
	end

	def create
		directory_id = params[:directory_id] || -1
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@leaf = @directory.leafs.build(params[:leaf])
		end	
		respond_to do |format|
    		if @leaf.save
      			format.html  { redirect_to(@directory, :notice => 'Leaf was successfully created.') }
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
