require 'redcarpet'

class Note < ActiveRecord::Base
	has_many :tags, :through => :tags_notes

	def self.generate_url(length=7)
		url = rand(36**length).to_s(36)

		# while Note.exists?(:url => @url) do
		# 	url = rand(36**length).to_s(36)
		# end

		puts "Generated URL #{url}}"

		return url
	end

	def self.process_markdown(source)
		renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
		markdown = Redcarpet::Markdown.new(renderer, extensions = {})

		return markdown.render(source)
	end

	def self.create_public_note(title, source)
		note = Note.new
		note.title = title
		note.source = source
		note.views = 0
		note.public = true

		return note
	end

	def self.get_recent(notes=10)
		return Note.find(:all, :order => "id desc", :limit => notes)
	end
end
