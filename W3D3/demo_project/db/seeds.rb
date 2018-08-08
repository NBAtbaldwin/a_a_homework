# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
falling_water = House.create(address: "277 Manhattan Avenue")
the_trap_house = House.create(address: "37 S Prospect Street")

tyler = Person.create(name: "Tyler", house_id: falling_water.id)
dan = Person.create(name: "Daniel", house_id: the_trap_house.id)
markus = Person.create(name: "Markus", house_id: falling_water.id)
