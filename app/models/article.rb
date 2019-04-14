# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :source
end
