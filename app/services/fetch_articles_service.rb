# frozen_string_literal: true

class FetchArticlesService
  def call
    @api_key = '882e10dd2b474a23bb7a3efa85e66b61'
    @newsapi = News.new(@api_key)
    @parsed_info = @newsapi.get_everything(q: 'news', from: Time.current.day)
    create_and_save_to_base
  end

  def create_and_save_to_base
    @parsed_info.each do |info_fields|
      @source = ::Source.find_or_create_by(google_id: info_fields.id, name: info_fields.name)
      @article = Article.create(source: @source, title: info_fields.title,
                                description: info_fields.description,
                                url: info_fields.url, url_to_image: info_fields.urlToImage,
                                published_at: info_fields.publishedAt)
    end
  end
end
