class Directory < ActiveRecord::Base
  attr_accessible :hr, :name, :note, :parent_id, :fav, :pin
  validates :hr, :name, :presence => true

  belongs_to :parent, :class_name => 'Directory'  
  has_many :directories, :inverse_of => :parent, :foreign_key => "parent_id" 
  has_many :leafs
  has_many :collectors

	def self.path_down(roots)
		find_by_sql(%Q{
			WITH RECURSIVE conx(level, path, id, parent_id) AS (
				SELECT 1 as level, ''||directories.id as path, directories.id, directories.parent_id FROM directories WHERE id in (#{roots.join(',')})
				UNION
				SELECT conx.level+1 as level, conx.path||'/'||directories.id as path, directories.id, directories.parent_id FROM directories, conx
				WHERE conx.id = directories.parent_id
				)
			SELECT bd.level, bd.path, d.* FROM directories as d
			join conx as bd on (bd.id = d.id)
			order by level, id, parent_id
		})
	end	

end
