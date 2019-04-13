# frozen_string_literal: true

class UserSource < ApplicationRecord
  belongs_to :user
  belongs_to :source
end
