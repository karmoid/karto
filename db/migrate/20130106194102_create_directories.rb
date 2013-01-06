class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :name
      t.string :hr
      t.text :note
      t.integer :parent_id

      t.timestamps
    end
  end
end
