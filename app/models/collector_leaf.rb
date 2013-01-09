class CollectorLeaf < ActiveRecord::Base
  attr_accessible :collector_id, :leaf_id

  belongs_to :collector
  belongs_to :leaf
end
