# Code Challenge - Backend - Bank Accounting

## Context

You must create a system that manages bank accounts of clients, allowing them to make transfers from a client to another and expose the current balance of the account, always in R$ reais.


## Feature #1 - Transfer Money

- **Input**: `<client_id>, <source_account_id>, <destination_account_id>, <amount>`

**Main flow**: 

1. The client makes a request with the above data
2. The system validates all data 
3. The system computes a debt in the source account
4. The system computes a credit on the destination account

**Exceptional flow**: the origin account doenst have enough balance
1. The system cancels the transfer


## Feature #2 - Checking balance

- Input: `<account_id>`

Main flow:
1. The client makes a request with the above data
2. The system calculates the current balance based on the history of transfers on that Account

Exceptional flow: Inexistent Account
1. The system responds that the informed account doenst exist.

# Implementation Details

**Dependencies:**
- Ruby on Rails version 5.2.3
- Devise
- Pry
- Rubocop
- docker-compose (for the database)

This setup uses docker-compose to raise a PostgreSQL database instance.

## > Implementation details of feature #1 - Transfer money

To build this feature, a specific service was created for the transfers, inside `services/transfer_service.rb`
This service is activated through the `service_controller.rb` when the request is received by the API

An authentication system was also made using `Devise` so the system could keep track of who originated the transfer.
The controller verifies if the client is currently logged in, and only then allows the transfer to be made.

On every transfer, and `Audit` record is created to keep track of all transfers, which will be usefull on feature #2 of this challenge.

### > Implementation details of feature #2 - Check balance

To build this feature, two properties were created on the Account Model:
- `initial_balance` 
- `updated_balance`

This was needed so that the debt and credit computations on the first feature (transfering money) could also work

This allows us to have a immutable initial amount that will be calculated based only on the history of transfers, as its requested by this specific feature, as will also allow the feature #1 to work paralel to this one.

To keep track of the history of transfers, an `Audit` model was created, and an entity of said model is created and saved on the database everytime a transaction is made.

This `Audit` model keeps track of the following data:
- The client that made the transfer
- The source account from which the money will be taken
- The destination account that will receive the money
- The amount of money transfered
Alongside those, theres also of course the standart Active Record date fields to keep track of when the records are created.

When a GET request is made to calculate the balance, the API pulls the record for the account ID sent with the request, calculates all deposits and withdraws, and computes those values against the initial balance of the account, returning the current balance in Brazilian Reais.

If the id passed by the request results in an non existing account, the system rescues the `ActiveRecord::RecordNotFound` error and returns a message saying the account doenst exist.

