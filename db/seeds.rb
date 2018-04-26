# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{name: 'josh', email: 'josh@email.com', password: 'password'}, {name: 'mike', email: 'mike@email.com', password: 'password'}])
Deck.create(name: "UB Control", user: users.first)
Deck.create(name: "Mono-Red", user: users.last)
Card.create(name: "fatal push", quantity: "4", deck: users.first.decks.first)
Card.create(name: "lightning strike", quantity: "4", deck: users.last.decks.first)
