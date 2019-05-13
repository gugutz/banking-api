# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client1 = Client.create(name: 'john', email: 'john@email.com', password: "encpass1")
client2 = Client.create(name: 'tobias', email: 'tobias@email.com', password: "encpass2")
client3 = Client.create(name: 'tom', email: 'tom@email.com', password: "encpass3")
client4 = Client.create(name: 'nina', email: 'nina@email.com', password: "encpass4")
account1 = Account.create(balance: 40_000, client_id: client1.id)
account2 = Account.create(balance: 70_000, client_id: client2.id)
account3 = Account.create(balance: 130_000, client_id: client3.id)
account4 = Account.create(balance: 130_000, client_id: client4.id)
audit1 = Audit.create(client_id: client1.id, source_account_id: account1.id, destination_account_id: account2.id, amount: 4_777)
audit2 = Audit.create(client_id: client2.id, source_account_id: account2.id, destination_account_id: account3.id, amount: 8_489)
audit3 = Audit.create(client_id: client1.id, source_account_id: account3.id, destination_account_id: account4.id, amount: 6_223)
