class AddSelectFieldsToCollectors < ActiveRecord::Migration
  def change
    add_column :collectors, :fav, :boolean, :default => false
    add_column :collectors, :pin, :boolean, :default => false
  end
end
