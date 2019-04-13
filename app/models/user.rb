# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, #:recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable
  validates :encrypted_password, length: { minimum: 8 }
  validates :first_name, :last_name, name: true
  validates_with EmailAddressValidator, fields: [:email]
  has_many :user_sources
  has_many :sources, through: :user_sources
end
