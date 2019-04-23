# frozen_string_literal: true

class NewsSource < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :articles, dependent: :destroy
  has_many :user_news_sources, dependent: :destroy
  has_many :users, through: :user_news_sources
end
