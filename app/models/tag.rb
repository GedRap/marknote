class Tag < ActiveRecord::Base
	has_and_belongs_to_many :notes, :join_table => :tags_notes

	def self.get_by_name(name)
		if Tag.exists?(:name => name)
			return Tag.where(:name => name).first
		else
			new_tag = Tag.new
			new_tag.name = name
			new_tag.save

			return new_tag
		end
	end
end
