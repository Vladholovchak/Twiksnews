# frozen_string_literal: true

class NewsMailerJob < ApplicationJob
  queue_as :default
  after_perform :set_schedule

  def perform
    NewsMailer.welcome_email(current_user).deliver
  end

  private

  def set_schedule
    NewsMailer.set(wait: 1.day).perform_later
  end
end
