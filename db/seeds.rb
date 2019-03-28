# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# USERS
include BCrypt

adrienne = User.find_or_create_by!(name: 'ad', password_digest: Password.create('123'))
brian = User.find_or_create_by!(name: 'br', password_digest: Password.create('abc'))
cody = User.find_or_create_by!(name: 'co', password_digest: Password.create('321'))
niky = User.find_or_create_by!(name: 'ni', password_digest: Password.create('cba'))

# CREATE BODY PARTS FROM IMAGES
["head", "torso", "leg"].each do |section|
  images = Dir.entries("#{Rails.root}/app/assets/images/#{section}s")
  images.each do |f|
    if f.end_with?('.svg')
      file = f.split('.svg').first # Get file name without .svg at the end
      file_parts = file.split('_')
      color = file_parts.pop # Pop color from end of file name
      BodyPart.find_or_create_by!(section: section, color: color, filename: file)
    end
  end
end


# Create random monsters
new_monster =
  {
    face_id: BodyPart.where(section: 'face').first.id,
    face_x: 0,
    face_y: 0,
    face_scale_x: 1.0,
    face_scale_y: 1.0,

    head_id: BodyPart.where(section: 'head').sample.id,
    head_x: 400/3,
    head_y: 0,
    head_scale_x: 1.0,
    head_scale_y: 1.0,

    torso_id: BodyPart.where(section: 'torso').sample.id,
    torso_x: 400/3,
    torso_y: 400/3 - 4,
    torso_scale_x: 1.0,
    torso_scale_y: 1.0,

    leg_id: BodyPart.where(section: 'leg').sample.id,
    leg_x: 400/3,
    leg_y: 800/3 - 8,
    leg_scale_x: 1.0,
    leg_scale_y: 1.0,

    happiness: 10,
    time_last_fed: Time.zone.now
  }

m1 = new_monster
m1[:name] = "Sullivan"
m2 = new_monster
m2[:name] = "Vim"
m3 = new_monster
m3[:name] = "Randal"
m4 = new_monster
m4[:name] = "Boo"
m5 = new_monster
m5[:name] = "Mike"
m6 = new_monster
m6[:name] = "Bowser"

# MONSTERS
sullivan = adrienne.monsters.find_or_create_by!(m1)
mike = adrienne.monsters.find_or_create_by!(m2)
vim = brian.monsters.find_or_create_by!(m3)
randal = brian.monsters.find_or_create_by!(m4)
boo = cody.monsters.find_or_create_by!(m5)
st = niky.monsters.find_or_create_by!(m6)
