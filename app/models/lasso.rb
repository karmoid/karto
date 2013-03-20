class Lasso < ActiveRecord::Base
  attr_accessible :directory_id, :hr, :name, :note, :fav, :pin
  validates :hr, :name, :presence => true

  belongs_to :directory
  belongs_to :layer 

  has_many :collector_trees
  has_many :children, :through => :collector_trees, :class_name => "Lasso"

  has_many :collector_leafs
  has_many :leafs, :through => :collector_leafs

	def detach_leaf(leaf_id)
		CollectorLeaf.delete_all(["lasso_id = ? and leaf_id = ?", self.id, leaf_id])
	end  

	def detach_lasso(lasso_id)
		CollectorTree.delete_all(["lasso_id = ? and child_id = ?", self.id, lasso_id])
	end  
end
