# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client1 = Client.create(name: 'john', password: "pass")
client2 = Client.create(name: 'tau', password: "pass")
account1 = Account.create(balance: 10_000, client: client1)
account2 = Account.create(balance: 30_000, client: client2)
