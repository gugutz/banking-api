# Bank API Challenge

This is the solution for a challenge for a job application

See the [challenge file](CHALLENGE.md) for a specific description.

Its a REST API that exposes 4 endpoints:

#### **`POST /login`**

*Parameters:* 
```
email: string
password: string
```

#### **`DELETE /logout`**

*Parameters:* 
```
email: string
```

#### **`POST /transfer`**


*Parameters:* 
```
"client_id": integer,
"source_account_id": integer,
"destination_account_id": integer,
"amount": integer
```

#### **`GET /balance`**

*Parameters:* 
```
id: integer
```


## Using the API

The following are examples on how you can send requests against the API Curl.

Feel free to use any HTTP client of your preference, though.

### How to make the request
To make a transfer on the API, use this format:

- **Logging in**
```
curl -i -H Content-Type\:\ application/json -XPOST http\://localhost\:3000/login -d \{'
'\ \ \ \ \"email\"\:\ \"tobias\@email.com\"\,'
'\ \ \ \ \"password\"\:\ \"encpass2\"'
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

[Apache License, Version 2.0](LICENSE) © [Thiago Santos](https://github.com/thiamsantos)
