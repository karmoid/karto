class Collector < ActiveRecord::Base
  attr_accessible :directory_id, :hr, :name, :note
  validates :hr, :name, :presence => true

  belongs_to :directory

  has_many :collector_trees
  has_many :collectors, :through => :collector_trees
  has_many :children, :through => :collector_trees, :foreign_key => "child_id", :class_name => "Collector" 
end