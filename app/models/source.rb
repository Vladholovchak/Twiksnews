# frozen_string_literal: true

class Source < ApplicationRecord
  validates :name, uniqueness: true
  has_many :articles, dependent: :destroy
  has_many :user_sources
  has_many :users, through: :user_sources
end
