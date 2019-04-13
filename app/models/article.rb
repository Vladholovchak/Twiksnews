# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :url, :content, presence: true
  belongs_to :source
end
