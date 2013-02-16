class AddLayerToCollectors < ActiveRecord::Migration
  def change
    add_column :lassos, :layer_id, :integer
  end
end
