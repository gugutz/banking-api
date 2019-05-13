# Bank API Challenge

This is the solution for a job application challenge.

See the [challenge file](CHALLENGE.md) for a specific description about it and details about the implementation.

## Description

This is a REST API made with Ruby on Rails that exposes 4 endpoints:

#### - **`POST /login`**

*Parameters:* 
```
email: string
password: string
```

#### - **`DELETE /logout`**

*Parameters:* 
```
email: string
```

#### - **`POST /transfer`**


*Parameters:* 
```
"client_id": integer,
"source_account_id": integer,
"destination_account_id": integer,
"amount": integer
```

#### - **`GET /balance`**

*Parameters:* 
```
id: integer
```


## Using the API

The following are examples on how you can send requests against the API the **Curl** terminal tool.

Feel free to use any HTTP client of your preference, though.

*_\* Note that these examples use seed data already fed into the database when you start the API server.
This also assumes you started the API on the default 3000 port on your local environment \*_ *

- **Logging in**
```
curl -i -H Content-Type\:\ application/json -XPOST http\://localhost\:3000/login -d \{'
'\ \ \ \ \"email\"\:\ \"tobias\@email.com\"\,'
'\ \ \ \ \"password\"\:\ \"encpass2\"'
'\}'
'
```

- **Logging out**
```
curl -i -H Content-Type\:\ application/json -XDELETE http\://localhost\:3000/logout -d \{'
'\ \ \ \ \"email\"\:\ \"tobias\@email.com\"'
'\}'
'
```

- **Getting an account balance**
```sh
curl -i -XGET http\://localhost\:3000/balance\?id\=1
```

- **Making a transfer**
```sh
curl -i -H Content-Type\:\ application/json -XPOST http\://localhost\:3000/transfer -d \{'
'\ \ \ \ \"client_id\"\:\ 2\,'
'\ \ \ \ \"source_account_id\"\:\ 2\,'
'\ \ \ \ \"destination_account_id\"\:\ 3\,'
'\ \ \ \ \"amount\"\:\ 5000'
'\}'
'
```

## Contributing

See the [contributing file](CONTRIBUTING.md).

## License

[Apache License, Version 2.0](LICENSE) © [Gustavo P Borges](https://github.com/gugutz)
