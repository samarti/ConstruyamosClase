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
apellidos = %w[Dib Marti Diaz Perez Soto Rodriguez Gonzalez Maturana Budnik Muñoz Huerta]


for i in 1..10
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

for i in 1..1000
  Student.create({first_name: "Estudiante #{i}", last_name: "Martí #{i}", email: "edib#{i}@uc.cl"})
end
