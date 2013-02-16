class FixLassoId < ActiveRecord::Migration
  def change
    rename_column :collector_leafs, :collector_id, :lasso_id
    rename_column :collector_trees, :collector_id, :lasso_id
  end
end
