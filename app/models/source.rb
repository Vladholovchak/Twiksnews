class Source < ApplicationRecord
  has_many :articles
  has_many :users, through: :user_sources
end
