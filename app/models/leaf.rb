class Leaf < ActiveRecord::Base
  attr_accessible :directory_id, :hr, :name, :note
  validates :hr, :name, :presence => true

  belongs_to :directory
  has_many :collectors

# Directory.path_down([1]).each do |d|
# 	puts d.hr+" ("+d.path+")"
# 	d.leafs.each do |l|
# 		puts l.hr
# 	end
# end  
end
