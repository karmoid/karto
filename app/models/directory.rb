class Directory < ActiveRecord::Base
  attr_accessible :hr, :name, :note, :parent_id
  validates :hr, :name, :presence => true

  belongs_to :parent, :class_name => 'Directory'  
  has_many :children, :inverse_of => :parent, :class_name => 'Directory', :foreign_key => "parent_id" 

	def self.path_down(roots)
		find_by_sql(%Q{
			WITH RECURSIVE conx(level, path, id, parent_id) AS (
				SELECT 1 as level, directories.parent_id||'/'||directories.id as path, directories.id, directories.parent_id FROM directories WHERE parent_id in (#{roots.join(',')})
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
