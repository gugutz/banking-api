# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client1 = Client.create(name: 'john', email: 'john@email.com', password: "encpass1")
client2 = Client.create(name: 'tobias', email: 'tobias@email.com', password: "encpass2")
account1 = Account.create(balance: 40_000, client: client1)
account2 = Account.create(balance: 70_000, client: client2)
