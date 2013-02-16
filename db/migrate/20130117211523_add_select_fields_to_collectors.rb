class AddSelectFieldsToCollectors < ActiveRecord::Migration
  def change
    add_column :lassos, :fav, :boolean, :default => false
    add_column :lassos, :pin, :boolean, :default => false
  end
end
