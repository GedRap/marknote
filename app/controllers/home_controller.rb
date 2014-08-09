class HomeController < ApplicationController
  def index
  	@notes = Note.get_recent()
  	@tags = Tag.get_tags_which_have_notes()
  end
end
