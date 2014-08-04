class Tags < ActiveRecord::Base
	has_many :notes, :through => :tags_notes
end
