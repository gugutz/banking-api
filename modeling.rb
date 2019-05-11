# -*- coding: utf-8 -*-
client {
  name: string
  password: hash
  has_one: account
}
account {
  balance: integer
  belongs_to: client
}

# -*- coding: utf-8 -*-
## POST /session
Cria uma sessão para o usuário (login).
### input:
{I 
  "email": "someemail@gmail.com",
  "password": "mypassword"
}
### output:
**success**
{
  "success": true, 
  "data": {
    "email": "someemail@gmail.com"
  },
  "error": null
}
**fail**
{
  "success": false, 
  "data": null,
  "error": {
    "code": 100,
    "message": "invalid email or password"
  }
}
## DELETE /session
Deleta uma sessão do usuário (logout).
### input:
None.
**success**
{
  "success": true, 
  "data": {
    "email": "someemail@gmail.com"
  },
  "error": null
}
**fail**
{
  "success": false, 
  "data": null,
  "error": {
    "code": 101,
    "message": "invalid session"
  }
}
## POST /transfer
Transferência bancária.
### input:
{
  "source_account_id": "91c3dc63-2cf6-4eae-a395-dfd6619a4ec5",
  "destination_account_id": "1b038a0e-0ede-42d5-a2b2-fb2613b8260c",
  "amount": 1000 // 10 reais
}
### output:
**success**
{
  "success": true,
  "data": {
    "source_account_id": "91c3dc63-2cf6-4eae-a395-dfd6619a4ec5",
    "destination_account_id": "1b038a0e-0ede-42d5-a2b2-fb2613b8260c",
    "amount": 1000
  },
  "error": null
}
**fail**
{
  "success": false,
  "data": null,
  "error": {
    "code": 102,
    "message": "not enough balance to complete transfer"
  }
}
## GET /balance?account_id=91c3dc63-2cf6-4eae-a395-dfd6619a4ec5
Saldo da conta.
## output
**success**
{
  "success": true,
  "data": {
    "amount": 1000
  },
  "error": null
}
**fail**
{
  "success": true,
  "data": {
    "amount": 1000
  },
  "error": {
    "code": 103,
    "message": "invalid account_id"
  }
}
## Pontos a considerar
- A transferência deve acontecer dentro de uma transaction. 
- Os valores de dinheiro devem estar em inteiro. Ex: 1050 é igual a 10,50 reais. Não se trabalha com float.
- Todos os inputs devem ser validados por existência, tipo e tamanho.
- O documento passa a ideia de que poderia de um usuário ter mais de uma conta. Se esse for o caso, deve ser validado se o usuário pode usar aquela conta passada como argumento é de fato dele. Caso ele sempre tenha apenas uma conta, talvez seja interessante retirar o parametro account_id do balance e o source_account_id do transfer.
- Nos bancos em geral eles se preocupam em esconder a identidade das contas, por esse motivo é recomendado usar uuid como ids em vez de integer sequencial.
- O formato de resposta é importante que siga um padrão. Esse que eu mandei é oq eu curto usar, mas de qualquer é legal ter uma padronização de como se lida com erros e sucessos.
- Sempre lembrar de usar os codes HTTP corretos, 422 para validação, 404 para not found, 401 para autenticação e 403 para autorização.
