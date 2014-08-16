module NotesHelper
	def render_note_widget(note)
		html = "<div class='col-md-4'>
				<div class='panel panel-default'>
					<div class='panel-heading'>
						<h3 class='panel-title'>
							<a href='/notes/#{note.id}'>#{note.title}</a>
						</h3>
					</div>
					<div class='panel-body'>"
		if note.tags.length > 0
			html += "<p>Tagged under "
			note.tags.each do |tag|
				html += "<a href='/tag/#{tag.id}/notes'>#{tag.name}</a> "
			end
		end
		
		html += "<p class='timestamp'>#{note.created_at}, Views: #{note.views}</p>
					</div>
				</div>
			</div>"
		return html.html_safe
	end
end
