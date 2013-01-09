class CollectorTree < ActiveRecord::Base
  attr_accessible :child_id, :collector_id

  belongs_to :collector
  belongs_to :child, :class_name => "Collector"
end
