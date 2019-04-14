require 'news-api'
class ParserService < News

  def initialize(keyword)
    @api_key = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
    @keyword = keyword
  end

  def call
    get_everything(q:@keyword)
  end

end
