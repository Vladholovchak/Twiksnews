# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user admin redactor]
  enum status: %i[deactivated activated]

  devise :database_authenticatable, :registerable, :validatable, :confirmable, :recoverable

  validates :email, uniqueness: true
  validates_with EmailAddressValidator, fields: [:email]

  has_one_attached :avatar
  has_many :user_news_sources
  has_many :news_sources, through: :user_news_sources
  has_many :articles, through: :news_sources

end
