# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email, 21 do |n|
      "jo#{n}@gmail.com"
    end
    password { '123456' }
    role { 0 }
    confirmed_at {Time.now}
  end

  factory :article do
    news_source_id { 1 }
    title { 'Jack Dorsey is recruiting his own personal bitcoin posse' }
    url { 'https://mashable.com/article/jack-dorsey-bitcoin-cryptocurrency-square/' }
    published_at { '2019-04-13 17:48:19' }
  end

  factory :news_source do
    name { 'TechCrunch' }
  end
end
