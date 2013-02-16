class CreateCollectors < ActiveRecord::Migration
  def change
    create_table :lassos do |t|
      t.string :name
      t.string :hr
      t.text :note
      t.integer :directory_id

      t.timestamps
    end
  end
end
