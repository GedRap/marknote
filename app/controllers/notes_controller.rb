class NotesController < ApplicationController

	def all
		@notes = Note.all
	end

	def create
		@note = Note.create_public_note(params[:title], params[:source])
		@note.url = Note.generate_url()
		@note.html = Note.process_markdown(@note.source).html_safe
		@note.save

		tag_names = params[:tags].split(/,( )?/)
		tag_names.reject! { |c| (c == " " or c.empty?) }

		@note.associate_with_tags(tag_names)
		@note.save
		
		redirect_to @note
	end

	def show
		@note = Note.find params[:id]
		@note_tags = @note.tags(:force_reload => true)

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

	def edit
		if not Note.exists?(:id => params[:id])
			redirect_to :home_index
		end

		@note = Note.find params[:id]
		tags_names = @note.get_tags_names

		@tags_joined = tags_names.join(", ")
	end

	def save
		if not Note.exists?(:id => params[:id])
			redirect_to :home_index
		end

		@note = Note.find params[:id]
		@note.title = params[:title]
		@note.source = params[:source]
		@note.html = Note.process_markdown(@note.source).html_safe
		@note.save

		tag_names = params[:tags].split(/,( )?/)
		tag_names.reject! { |c| (c == " " or c.empty?) }

		@note.associate_with_tags(tag_names)
		@note.save

		redirect_to @note
	end
end
