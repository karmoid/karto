class Layer < ActiveRecord::Base
  attr_accessible :hr, :name, :note
  has_many :directories
  has_many :lassos
  has_many :leafs
end
