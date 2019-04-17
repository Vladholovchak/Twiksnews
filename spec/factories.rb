# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Joe' }
    last_name { 'Arri' }
    sequence :email, 21 do |n|
      "jo#{n}@gmail.com"
    end
    password { '12345678' }
    role { 0 }
  end

  factory :article do
    source_id { 1 }
    title { 'Jack Dorsey is recruiting his own personal bitcoin posse' }
    url { 'https://mashable.com/article/jack-dorsey-bitcoin-cryptocurrency-square/' }
    published_at { '2019-04-13 17:48:19' }
  end

  factory :source do
    name { 'TechCrunch' }
  end
end
