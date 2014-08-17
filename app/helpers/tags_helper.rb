module TagsHelper
	def render_tag_widget(tag)
		html = "<div class='col-md-4'>
				<div class='panel panel-default'>
					<div class='panel-heading'>
						<h3 class='panel-title'>
							<a href='/tag/#{tag.id}/notes'>#{tag.name}</a>
						</h3>
					</div>
					<div class='panel-body'><p>Some of the notes:</p>"
					
		tag.notes[0..2].each do |note|
			html += "<p><a href='/notes/#{note.id}'>#{note.title}</a></p>"
		end
		
		html += "<p class='timestamp'>Total Notes: #{tag.notes.length}</p>
					</div>
				</div>
			</div>"
		return html.html_safe
	end
end
