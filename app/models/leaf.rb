class Leaf < ActiveRecord::Base
  attr_accessible :directory_id, :hr, :name, :note, :fav, :pin
  validates :hr, :name, :presence => true

  belongs_to :directory
  belongs_to :layer 
  
  has_many :collector_leafs
  has_many :lassos, :through => :collector_leafs


# Directory.path_down([1]).each do |d|
# 	puts d.hr+" ("+d.path+")"
# 	d.leafs.each do |l|
# 		puts l.hr
# 	end
# end  
end
