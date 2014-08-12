class Tag < ActiveRecord::Base
	has_and_belongs_to_many :notes, :join_table => :tags_notes

	# Returns tags which have at least one note
	def self.get_tags_which_have_notes()
		return Tag.where("EXISTS(SELECT 1 FROM tags_notes WHERE tags.id = tags_notes.tag_id)").all
	end

	def self.search(query)
		tokens_list = query.split(/ /)
		tokens = tokens_list.join(" & ")
		return Tag.where("to_tsvector('english', name) @@ to_tsquery('english', '#{tokens}')").all
	end

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
