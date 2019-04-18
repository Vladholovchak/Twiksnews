class NewsFetchersController < ApplicationController


  def fetch_news
    authorize User
    FetchArticlesService.new.create_articles
    redirect_to root_path
    flash[:success] = "Articles updated!"
  end

  def fetch_sources
    authorize User
    FetchArticlesService.new.create_sources
    redirect_to root_path
    flash[:success] = "Sources Updated!"
end

end
