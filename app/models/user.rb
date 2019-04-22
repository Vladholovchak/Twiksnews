# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user admin redactor]
  enum status: %i[deactivated activated]

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, #:recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable

  validates :email, uniqueness: true
  validates_with EmailAddressValidator, fields: [:email]

  has_one_attached :avatar
  has_many :user_sources
  has_many :sources,  through: :user_sources
  has_many :articles, through: :sources
end
