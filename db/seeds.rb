# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{name: 'josh', email: 'josh@email.com', password: 'password'}, {name: 'mike', email: 'mike@email.com', password: 'password'}])
Deck.create(name: "UB Control", user: User.find_by(:name => "josh"))
Card.create(name: "fatal push", quantity: "4", deck: users.first.decks.first)
Card.create(name: "disallow", quantity: "3", deck: users.first.decks.first)
Card.create(name: "scarab god", quantity: "2", deck: users.first.decks.first)
Card.create(name: "torrential gearhulk", quantity: "4", deck: users.first.decks.first)

Deck.create(name: "Mono-Green", user: User.find_by(:name => "josh"))
Card.create(name: "jadelight ranger", quantity: "4", deck: users.first.decks.last)
Card.create(name: "blossoming defense", quantity: "4", deck: users.first.decks.last)
Card.create(name: "ghalta", quantity: "2", deck: users.first.decks.last)
Card.create(name: "rhonas' monument", quantity: "4", deck: users.first.decks.last)

Deck.create(name: "Mono-Red", user: User.find_by(:name => "mike"))
Card.create(name: "lightning strike", quantity: "4", deck: users.last.decks.first)
Card.create(name: "glorybringer", quantity: "3", deck: users.last.decks.first)
Card.create(name: "shock", quantity: "2", deck: users.last.decks.first)
Card.create(name: "soul-scar mage", quantity: "4", deck: users.last.decks.first)

Deck.create(name: "Burn", user: User.find_by(:name => "mike"))
Card.create(name: "lightning bolt", quantity: "4", deck: users.last.decks.last)
Card.create(name: "boros charm", quantity: "4", deck: users.last.decks.last)
Card.create(name: "lava spike", quantity: "4", deck: users.last.decks.last)
Card.create(name: "goblin guide", quantity: "4", deck: users.last.decks.last)
