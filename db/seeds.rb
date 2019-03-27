# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# USERS
adrienne = User.find_or_create_by(name: 'Adrienne')
brian = User.find_or_create_by(name: 'Brian')
cody = User.find_or_create_by(name: 'Cody')
niky = User.find_or_create_by(name: 'Niky')

# MONSTERS
sullivan = adrienne.monsters.find_or_create_by!(name: 'Sullivan')
mike = adrienne.monsters.find_or_create_by!(name: 'Mike')
vim = brian.monsters.find_or_create_by!(name: 'Vim')
randal = brian.monsters.find_or_create_by!(name: 'Randal')
boo = cody.monsters.find_or_create_by!(name: 'Boo')
st = niky.monsters.find_or_create_by!(name: 'Storm Trooper')

# CREATE BODY PARTS FROM IMAGES
["head", "torso", "leg"].each do |section|
  images = Dir.entries("#{Rails.root}/app/assets/images/#{section}s")
  images.each do |f|
    if f.end_with?('.svg')
      file = f.split('.svg').first # Get file name without .svg at the end
      file_parts = file.split('_')
      color = file_parts.pop # Pop color from end of file name
      filename = file_parts.size == 1 ? file_parts.first : file_parts.join('_') # Get file name w/ out color
      BodyPart.find_or_create_by!(section: section, color: color, filename: file)
    end
  end
end

# GIVE MONSTERS RANDOM BODY PARTS
Monster.all.each do |m|
  h = BodyPart.where(section: "head").sample
  t = BodyPart.where(section: "torso").sample
  l = BodyPart.where(section: "leg").sample
  params = {head_id: h.id, torso_id: t.id, leg_id: l.id}
  m.update(params)
end





