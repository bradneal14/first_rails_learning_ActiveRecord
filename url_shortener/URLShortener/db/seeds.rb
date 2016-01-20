# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  u1 = User.create( :email => 'cj@example.com')
  u2 = User.create( :email => 'flarnie@example.com')
  u3 = User.create( :email => 'jeff@example.com')
  u4 = User.create( :email => 'gstp@example.com')
  u5 = User.create( :email => 'ned@example.com')


  ShortenedUrl.create_for_user_and_long_url!(u1, 'long_url.one')
  ShortenedUrl.create_for_user_and_long_url!(u2, 'long_url.two')
  ShortenedUrl.create_for_user_and_long_url!(u3, 'long_url.three')
  ShortenedUrl.create_for_user_and_long_url!(u4, 'long_url.four')
  ShortenedUrl.create_for_user_and_long_url!(u5, 'long_url.five')
end
