Feature: Testar a funcionalidade do endpoint PUT /api/v1/orders/:id

  Scenario: Inserir um item no KIT
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 200 OK

  Scenario: Enviar requisição PUT com o campo "ID" vazio
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": , "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT com letras no campo "ID"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": "Batata", "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT com símbolos no campo "ID"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": "!@#", "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT sem números no campo "ID"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id":, "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT excluindo o campo "ID"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT sem números no campo "quantity"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT com letras no campo "quantity"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": "batata" }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT com símbolos no campo "quantity"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": "!@#!" }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT excluindo o campo "quantity"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição PUT excluindo o campo "ID" e o "quantity"
    Given uma ordem com ID válido
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Alterar um pedido que não existe
    Given um ID de ordem que não existe
    When eu envio uma requisição PUT para "/api/v1/orders/:id" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 404 Not Found
