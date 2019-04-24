# frozen_string_literal: true

class NewsMailerJob < ApplicationJob
  queue_as :default
  def perform
    users = User.all.where(send_news: true, status: activated)
    users.each do |user|
      if user.articles.present?
        NewsMailer.news_email(user).deliver
      end
    end
  end
end
