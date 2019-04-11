# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
load 'db/fixtures/activities.rb'
load 'db/fixtures/languages.rb'
load 'db/fixtures/guides.rb'
load 'db/fixtures/guidelanguage.rb'