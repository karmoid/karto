class LassosController < ApplicationController
	def show
		lasso_id = params[:id]
		@lasso = Lasso.find(lasso_id)
		@favs = []
		@pins = []
		@favs << Directory.where(:fav => true)
		@pins << Directory.where(:pin => true)
		@favs << Lasso.where(:fav => true)
		@pins << Lasso.where(:pin => true)
		@favs << Leaf.where(:fav => true)
		@pins << Leaf.where(:pin => true)
	end

	def new
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@lasso = @directory.lassos.build
		end	
	end

	def create
		directory_id = params[:directory_id] || -1
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@lasso = @directory.lassos.build(params[:lasso])
		end	
		respond_to do |format|
    		if @lasso.save
      			format.html  { redirect_to(@directory, :notice => 'Lasso was successfully created.') }
    		else
      			format.html  { render :action => "new" }
    		end			
		end	
	end

	def edit
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@lasso = @directory.lassos.find(params[:id])
		end	
	end

	def update
		@lasso = Lasso.find(params[:id])
		respond_to do |format|
			if @lasso.update_attributes(params[:lasso])  
				format.html { redirect_to(@lasso.directory, :notice => 'Lasso was successfully updated.') } 
			else	
				format.html { redirect_to(@lasso.directory, :notice => "Lasso wasn't successfully updated.") }
			end
		end
	end
end
