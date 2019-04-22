# frozen_string_literal: true

class NewsMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @articles = @user.articles.published_today
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
