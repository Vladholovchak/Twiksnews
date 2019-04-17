# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
