# frozen_string_literal: true

class FetchArticlesService

  def call
    @api_key = '882e10dd2b474a23bb7a3efa85e66b61'
    @newsapi = News.new(@api_key)
    @parsed_info = @newsapi.get_everything(q: 'news', from: Time.current.day)
  end

  def create_sources
    call
    @parsed_info.each do |info_fields|
      ::Source.find_or_create_by(google_id: info_fields.id, name: info_fields.name)
    end
  end

  def create_articles
    call
    @parsed_info.each do |info_fields|
    Article.find_or_create_by(source: Source.find_by_name(info_fields.name), title: info_fields.title,
                              description: info_fields.description,
                              url: info_fields.url, url_to_image: info_fields.urlToImage,
                              published_at: info_fields.publishedAt)
    end
    end
end
