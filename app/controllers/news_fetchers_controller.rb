class NewsFetchersController < ApplicationController
  skip_after_action :verify_authorized, only: [:news_send]
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

  def news_send
    @user = current_user
    NewsMailer.welcome_email(@user).deliver
    redirect_to root_path
  end

  def user_params
    params.require(@user).permit(:id)
  end
end
