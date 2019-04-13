# frozen_string_literal: true

class EmailAddressValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any? { |field| record.send(field).match(/[[:punct:]]ru$/) }
      record.errors[:base] << 'This person is from Russia'
    end
  end
end
