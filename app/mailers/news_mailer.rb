# frozen_string_literal: true

class NewsMailer < ApplicationMailer
  def news_email(user)
    @user = user
    @articles = @user.articles.published_today
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Fresh news from your NewsSources')
  end
end
