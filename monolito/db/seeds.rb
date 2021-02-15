# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.create(codigo:'001',numero_documento:'28374829',codigo_usuario:'001',nombre: 'Juan', correo_corporativo:'administrador@grupo1.com',contraseña:'1234',perfil:'Administrador',apellido:'Sanchez',tipo_doc:'DNI',)
Usuario.create(codigo:'002',numero_documento:'28322829',codigo_usuario:'002',nombre: 'Omar', correo_corporativo:'gerente@grupo1.com',contraseña:'1234',perfil:'Gerente',apellido:'Suarez',tipo_doc:'DNI',)
Usuario.create(codigo:'003',numero_documento:'18374119',codigo_usuario:'003',nombre: 'Miguel', correo_corporativo:'asesor@grupo1.com',contraseña:'1234',perfil:'Asesor',apellido:'Perez',tipo_doc:'DNI',)