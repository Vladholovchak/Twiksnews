# frozen_string_literal: true

class Article < ApplicationRecord
  has_one_attached :image
  validates :url, uniqueness: true
  validates :title, :url, :published_at, presence: true
  belongs_to :news_source
  scope :published_today, -> {where('articles.created_at >= ?', 1.day.ago)}
end
