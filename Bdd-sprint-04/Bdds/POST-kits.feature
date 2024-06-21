Feature: Testar a funcionalidade do endpoint POST /api/v1/kits/{id}/products

  Scenario: Inserir um item no KIT
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 200 OK

  Scenario: Adicionar mais quantidade ao item no KIT
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": 50 }
        ]
      }
      """
    Then a resposta deve ser 200 OK

  Scenario: Reduzir a quantidade de items no KIT
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": -50 }
        ]
      }
      """
    Then a resposta deve ser 200 OK

  Scenario: Enviar requisição POST com o campo "ID" vazio
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": , "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST com letras no campo "ID"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": "Batata", "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST com símbolos no campo "ID"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": "!@#", "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST sem números no campo "ID"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id":, "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST excluindo o campo "ID"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "quantity": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST sem números no campo "quantity"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST com letras no campo "quantity"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": "batata" }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST com símbolos no campo "quantity"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1, "quantity": "!@#!" }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST excluindo o campo "quantity"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { "id": 1 }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request

  Scenario: Enviar requisição POST excluindo o campo "ID" e o "quantity"
    Given um kit com ID válido
    When eu envio uma requisição POST para "/api/v1/kits/{id}/products" com o corpo:
      """
      {
        "productsList": [
          { }
        ]
      }
      """
    Then a resposta deve ser 400 Bad Request
