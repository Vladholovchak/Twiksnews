# frozen_string_literal: true

class UserNewsSource < ApplicationRecord
  belongs_to :user
  belongs_to :news_source
end
