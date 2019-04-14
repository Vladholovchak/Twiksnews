# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, :url, :published_at, presence: true
  belongs_to :source
end
