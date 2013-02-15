class AddLayerToCollectors < ActiveRecord::Migration
  def change
    add_column :collectors, :layer_id, :integer
  end
end
