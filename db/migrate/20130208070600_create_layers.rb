class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :name
      t.string :hr
      t.text :note

      t.timestamps
    end
  end
end
