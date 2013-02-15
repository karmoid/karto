class AddLayerToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :layer_id, :integer
  end
end
