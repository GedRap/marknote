class TagsController < ApplicationController
  def notes
  	@tag = Tag.find(params[:id])
  	@notes = @tag.notes()
  end
end
