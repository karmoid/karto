class CollectorsController < ApplicationController
	def show
		collector_id = params[:id]
		@collector = Collector.find(collector_id)
	end

	def new
		directory_id = params[:directory_id]
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@collector = @directory.collectors.build
		end	
	end

	def create
		directory_id = params[:directory_id] || -1
		@directory = Directory.find(directory_id)
		unless @directory.nil?
			@collector = @directory.collectors.build(params[:collector])
		end	
		respond_to do |format|
    		if @collector.save
      			format.html  { redirect_to(@directory, :notice => 'Collector was successfully created.') }
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