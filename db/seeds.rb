# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_url = "http://www.google.cl"
for i in 1..20
  Document.create({url: default_url, description: "Este es el documento número #{i}"})
end

for i in 1..100
  Teacher.create({first_name: "Profesor #{i}", last_name: "Diaz #{i}", email: "samarti#{i}@uc.cl", password:"#{100000+i}"})
end

Level.create([{name:"Pre kinder"}, {name:"Kinder"}, {name:"Primero Básico"}, {name:"Segundo Básico"}, {name:"Tercero Básico"}, {name:"Cuarto Básico"},
  {name:"Quinto Básico"}, {name:"Sexto Básico"}, {name:"Séptimo Básico"}, {name:"Octavo Básico"}, {name:"Primero Medio"}, {name: "Segundo Medio"},
  {name:"Tercero Medio"}, {name:"Cuarto Medio"}])

Subject.create([{name:"Matemáticas"}, {name:"Lenguaje"}, {name:"Historia"}, {name:"Biología"}, {name:"Química"}, {name:"Física"}, {name:"Filosofía"},
  {name:"Deportes"}, {name:"Geografía"}, {name:"Inglés"}, {name:"Francés"}, {name:"Alemán"}])

for i in 1..1000
  Student.create({first_name: "Estudiante #{i}", last_name: "Martí #{i}", email: "edib#{i}@uc.cl"})
end
