# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# USERS
adrienne = User.create!(name: 'Adrienne')
brian = User.create!(name: 'Brian')
cody = User.create!(name: 'Cody')
niky = User.create!(name: 'Niky')

# MONSTERS
sullivan = adrienne.monsters.create!(name: 'Sullivan')
mike = adrienne.monsters.create!(name: 'Mike')
vim = brian.monsters.create!(name: 'Vim')
randal = brian.monsters.create!(name: 'Randal')
boo = cody.monsters.create!(name: 'Boo')
st = niky.monsters.create!(name: 'Storm Trooper')

# BODY PARTS
Monster.all.each do |m| 
  h = BodyPart.create(section: "head")
  t = BodyPart.create(section: "torso")
  l = BodyPart.create(section: "leg")
  params = {head_id: h.id, torso_id: t.id, leg_id: l.id}

  m.update(params)
end
  



