# frozen_string_literal: true

class FetchArticlesService
  def call
    @api_key = Rails.application.credentials.api_key
    @newsapi = News.new(@api_key)
    @parsed_info = @newsapi.get_everything(q: 'news')
  end

  def create_sources
    call
    @parsed_info.each do |info_fields|
      NewsSource.find_or_create_by(name: info_fields.name)
    end
  end

  def create_articles
    call
    @sources = NewsSource.all
    @parsed_info.each do |info_fields|
      Article.find_or_create_by(news_source: @sources.find_by_name(info_fields.name),
                                title: info_fields.title,
                                description: info_fields.description,
                                url: info_fields.url,
                                url_to_image: info_fields.urlToImage,
                                published_at: info_fields.publishedAt)
    end
  end
end
