class CollectorLeaf < ActiveRecord::Base
  attr_accessible :lasso_id, :leaf_id

  belongs_to :lasso
  belongs_to :leaf
  
end
