class CreateCollectorTrees < ActiveRecord::Migration
  def change
    create_table :collector_trees do |t|
      t.integer :collector_id
      t.integer :child_id
    end
  end
end
