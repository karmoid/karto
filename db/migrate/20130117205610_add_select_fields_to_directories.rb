class AddSelectFieldsToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :fav, :boolean, :default => false
    add_column :directories, :pin, :boolean, :default => false
  end
end
