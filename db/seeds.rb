# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
model_list = [
    'ПЭТД',
    'ПЭТВ',
    'ПуГВ',
    'АПБ',
]

model_list.each do |name|
 Model.create(name: name)
end

color_list = [
    'красный',
    'оранжевый',
    'жёлтый',
    'зелёный',
    'голубой',
    'фиолетовый'
]

color_list.each do |name|
 Color.create(name: name)
end
