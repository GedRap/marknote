class NotesController < ApplicationController
	def create
		@note = Note.create_public_note(params[:title], params[:source])
		@note.url = Note.generate_url()
		@note.html = Note.process_markdown(@note.source).html_safe
		@note.save
		
		redirect_to @note
	end

	def show
		@note = Note.find params[:id]

		@note.views = @note.views + 1
		@note.save

		if @note.html != nil
			@note.html = @note.html.html_safe
		end
	end

	def delete
		if Note.exists?(:id => params[:id])
			@note = Note.find params[:id]
			@note.destroy
		end

		redirect_to :home_index
	end
end
