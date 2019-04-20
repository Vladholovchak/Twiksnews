# frozen_string_literal: true

class Article < ApplicationRecord
  has_one_attached :image
  validates :url, uniqueness: true
  #validates :title, :url, :published_at, presence: true
  belongs_to :source
end
