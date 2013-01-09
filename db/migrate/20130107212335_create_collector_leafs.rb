class CreateCollectorLeafs < ActiveRecord::Migration
  def change
    create_table :collector_leafs do |t|
      t.integer :collector_id
      t.integer :leaf_id
    end
  end
end
