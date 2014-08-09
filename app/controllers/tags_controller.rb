class TagsController < ApplicationController
	def all
		@tags = Tag.get_tags_which_have_notes()
	end

	def notes
		@tag = Tag.find(params[:id])
		@notes = @tag.notes()
	end
end
