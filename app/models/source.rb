# frozen_string_literal: true

class Source < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :articles, dependent: :destroy
  has_many :user_sources, dependent: :destroy
  has_many :users, through: :user_sources
end
