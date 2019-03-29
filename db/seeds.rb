# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# # USERS
require './config/secret/keys.rb'
include BCrypt
include Keys

# ADMINS
adrienne = User.find_or_create_by!(name: 'adrienne', is_admin?: true, password_digest: Password.create(Keys.adrienne))
brian = User.find_or_create_by!(name: 'brian', is_admin?: true, password_digest: Password.create(Keys.brian))
# cody = User.find_or_create_by!(name: 'co', password_digest: Password.create('321'))
# niky = User.find_or_create_by!(name: 'ni', password_digest: Password.create('cba'))

# CREATE BODY PARTS FROM IMAGES
["head", "torso", "leg", "face"].each do |section|
  images = Dir.entries("#{Rails.root}/app/assets/images/#{section}s")
  images.each do |f|
    if f.end_with?('.svg')
      filename = f.split('.svg').first # Get file name without .svg at the end
      file_parts = filename.split('_')
      color = file_parts.pop # Pop color from end of file name
      BodyPart.find_or_create_by!(section: section, color: color, filename: filename)
    end
  end
end