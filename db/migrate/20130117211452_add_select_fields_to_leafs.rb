class AddSelectFieldsToLeafs < ActiveRecord::Migration
  def change
    add_column :leafs, :fav, :boolean, :default => false
    add_column :leafs, :pin, :boolean, :default => false
  end
end
