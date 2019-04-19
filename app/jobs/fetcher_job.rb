class FetcherJob < ApplicationJob
  queue_as :default
  after_perform :set_schedule

  def perform
    FetchArticlesService.new.create_articles
  end

  private

  def set_schedule
    FetcherJob.set(wait: 1.minute).perform_later
  end

end
