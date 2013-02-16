class CollectorTree < ActiveRecord::Base
  attr_accessible :child_id, :lasso_id

  belongs_to :lasso
  belongs_to :child, :class_name => "Lasso"
end
