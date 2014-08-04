class HomeController < ApplicationController
  def index
  	@notes = Note.get_recent()
  end
end
