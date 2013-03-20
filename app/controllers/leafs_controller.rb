class LeafsController < ApplicationController
	def show
		leaf_id = params[:id]
		@leaf = Leaf.find(leaf_id)
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
			@leaf = @directory.leafs.build
		end	
	end

	def detach
		lasso_id = params[:lasso_id]
		@lasso = Lasso.find(lasso_id)
		unless @lasso.nil?
			@lasso.detach_leaf(params[:id])
		end	
		show
		render :show
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
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@leaf = @directory.leafs.find(params[:id])
		end	
	end

	def update
		@leaf = Leaf.find(params[:id])
		respond_to do |format|
			if @leaf.update_attributes(params[:leaf])  
				format.html { redirect_to(@leaf.directory, :notice => 'Leaf was successfully updated.') } 
			else	
				format.html { redirect_to(@leaf.directory, :notice => "Leaf wasn't successfully updated.") }
			end
		end
	end
end
