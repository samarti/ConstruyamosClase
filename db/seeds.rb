# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_url = "http://www.google.cl"

for i in 1..100
  Teacher.create({first_name: "Profesor #{i}", last_name: "Diaz #{i}", email: "samarti#{i}@uc.cl", password:"#{100000+i}", profile_picture: "http://findicons.com/files/icons/1580/devine_icons_part_2/128/account_and_control.png"})
end

Level.create([{name:"Pre kinder"}, {name:"Kinder"}, {name:"Primero Básico"}, {name:"Segundo Básico"}, {name:"Tercero Básico"}, {name:"Cuarto Básico"},
  {name:"Quinto Básico"}, {name:"Sexto Básico"}, {name:"Séptimo Básico"}, {name:"Octavo Básico"}, {name:"Primero Medio"}, {name: "Segundo Medio"},
  {name:"Tercero Medio"}, {name:"Cuarto Medio"}])

Subject.create([{name:"Matemáticas"}, {name:"Lenguaje"}, {name:"Historia"}, {name:"Biología"}, {name:"Química"}, {name:"Física"}, {name:"Filosofía"},
  {name:"Deportes"}, {name:"Geografía"}, {name:"Inglés"}, {name:"Francés"}, {name:"Alemán"}])

document = Document.create({url: default_url, name: "Documento #{i}", description: "Este es el documento número #{i} y te dice Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})

Teacher.fifth.documents << document
document.levels << Level.first
document.subjects << Subject.third

for i in 1..15
randomizer = Random.new
r = randomizer.rand(1..5)
rating = Rating.create({grade: r, comment: "Este documento me gustó mucho, pero la verdad es que le falta un poco de profundidad"})
Teacher.find(i).ratings << rating
document.ratings << rating
end


for i in 1..1000
  Student.create({first_name: "Estudiante #{i}", last_name: "Martí #{i}", email: "edib#{i}@uc.cl"})
end
