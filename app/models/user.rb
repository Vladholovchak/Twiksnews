# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, #:recoverable, :rememberable
  devise :database_authenticatable, :registerable #:validatable
  has_many :user_sources
  has_many :sources, through: :user_sources
end
