class RenameCollectorsToLassos < ActiveRecord::Migration
	def change
        rename_table :lassos, :lassos
    end 
end
