# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

default_url = "http://www.google.cl"
randomizer = Random.new
tags = %w[matematicas lenguaje fisica quimica biologia musica historia]
nombres = %w[Esteban Javier Santiago Alfonso Adrian Monica Macarena Evelyn Sasha Elisa Mijal]
apellidos = %w[Dib Marti Diaz Perez Soto Rodriguez Gonzalez]


for i in 1..20
  nombre = nombres.sample
  nombres.delete(nombre)
  apellido = apellidos.sample
  apellidos.delete(apellido)
  Teacher.create({first_name: "#{nombre}", last_name: "#{apellido}", email: "#{nombre}@#{apellido}.cl", password:"#{123456}", profile_picture: "http://findicons.com/files/icons/1580/devine_icons_part_2/128/account_and_control.png"})
end

Level.create([{name:"Pre kinder"}, {name:"Kinder"}, {name:"Primero Básico"}, {name:"Segundo Básico"}, {name:"Tercero Básico"}, {name:"Cuarto Básico"},
  {name:"Quinto Básico"}, {name:"Sexto Básico"}, {name:"Séptimo Básico"}, {name:"Octavo Básico"}, {name:"Primero Medio"}, {name: "Segundo Medio"},
  {name:"Tercero Medio"}, {name:"Cuarto Medio"}])

Subject.create([{name:"Matemáticas"}, {name:"Lenguaje"}, {name:"Historia"}, {name:"Biología"}, {name:"Química"}, {name:"Física"}, {name:"Filosofía"},
  {name:"Deportes"}, {name:"Geografía"}, {name:"Inglés"}, {name:"Francés"}, {name:"Alemán"}])

#for i in 1..25
#  document = Document.new({average_rating: 0, url: default_url, name: "Documento #{i}", description: "Este es el documento número #{i} y te dice Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
#  doc_tags = tags.sample(randomizer.rand(1..tags.size))
#  document.doc_tag_list.add(doc_tags)
#  #document.tags = doc_tags.to_json
#  document.save
#
#  max = randomizer.rand(1..15)
#  for j in 1..max
#    r = randomizer.rand(1..5)
#    teacher = randomizer.rand(1..100)
#    rating = Rating.new({grade: r, comment: "Este documento me gustó mucho, pero la verdad es que le falta un poco de profundidad"})
#    Teacher.find(teacher).ratings << rating
#    document.ratings << rating
#    rating.save
#  end
#  teacher = randomizer.rand(1..100)
#  level = Level.find(randomizer.rand(1..14))
#  subject = Subject.find(randomizer.rand(1..12))
#  document.doc_tag_list.add(level.name)
#  document.doc_tag_list.add(subject.name)
#  Teacher.find(teacher).documents << document
#  document.levels << level
#  document.subjects << subject
#end


for i in 1..1000
  Student.create({first_name: "Estudiante #{i}", last_name: "Martí #{i}", email: "edib#{i}@uc.cl"})
end
