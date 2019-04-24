# frozen_string_literal: true

class NewsMailerJob < ApplicationJob
  queue_as :default
  def perform
    users = User.all.where(send_news: true)
    users.each do |user|
      if user.articles.present? && user.status.activated?
        NewsMailer.news_email(user).deliver
      end
    end
  end
end
