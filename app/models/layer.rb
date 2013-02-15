class Layer < ActiveRecord::Base
  attr_accessible :hr, :name, :note
  has_many :directories
  has_many :collectors
  has_many :leafs
end
