# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_list = [
  ['12345@mail.com', '81831000'],
  ['14345@mail.com', '65447374'],
  ['16345@mail.com', '10839905'],
  ['18345@mail.com', '16680000']
]

users_list.each do |mail, pas|
  User.create(email: mail, password: pas)
end
