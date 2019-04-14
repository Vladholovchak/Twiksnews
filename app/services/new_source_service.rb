require_relative 'parser_service'

class NewSourceService

  def call
    parsed_info = ParserService.new('apple').call
    parsed_info.each do |info_fields|

      @source = Source.new(google_id: info_fields.id, name: info_fields.name)
      if @source.name != Source.find_by_name(@source.name)
        @source.save
      end
      @article = Article.new(source_id: Source.find_by_name(@source.name).id,title: info_fields.title,
                  description: info_fields.description, url: info_fields.url,
                  url_to_image: info_fields.urlToImage,
                  published_at: info_fields.publishedAt)
      @article.save
    end
  end
end
