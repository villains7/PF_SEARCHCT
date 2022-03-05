class  Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @records = Project.search_for(@content)
  end
end
