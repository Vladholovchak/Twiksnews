# # frozen_string_literal: true

class UpdateSourcesJob < ApplicationJob
  queue_as :default

  discard_on ActiveJob::DeserializationError

  def perform
    FetchArticlesService.new.create_sources
  end
end
