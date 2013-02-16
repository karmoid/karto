class Lasso < ActiveRecord::Base
  attr_accessible :directory_id, :hr, :name, :note, :fav, :pin
  validates :hr, :name, :presence => true

  belongs_to :directory
  belongs_to :layer 
  
  has_many :collector_trees
  has_many :lassos, :through => :collector_trees
  has_many :children, :through => :collector_trees, :foreign_key => "child_id", :class_name => "Lasso" 
end
