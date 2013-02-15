class AddLayerToLeafs < ActiveRecord::Migration
  def change
    add_column :leafs, :layer_id, :integer
  end
end
