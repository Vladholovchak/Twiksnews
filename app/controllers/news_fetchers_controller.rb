# frozen_string_literal: true

class NewsFetchersController < ApplicationController
  skip_after_action :verify_authorized, only: [:news_send]
  def fetch_news
    authorize User
    FetcherJob.set(wait: 10.seconds).perform_later
    redirect_to root_path
    flash[:success] = 'Articles will be updated after 10 seconds!'
  end

  def fetch_sources
    authorize User
    SourcesFetchJob.set(wait: 10.seconds).perform_later
    redirect_to root_path
    flash[:success] = 'Sources will be updated after 10 seconds!'
  end

  def news_send
    @user = current_user
    NewsMailer.welcome_email(@user).deliver_later(wait: 10.seconds)
    redirect_to root_path
  end

  def user_params
    params.require(@user).permit(:id)
  end
end
