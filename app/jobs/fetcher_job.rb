# frozen_string_literal: true

class FetcherJob < ApplicationJob
  queue_as :default

  discard_on ActiveJob::DeserializationError

  def perform
    FetchArticlesService.new.create_articles
  end
end
