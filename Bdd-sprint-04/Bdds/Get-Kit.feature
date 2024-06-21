Feature: Testar a funcionalidade do endpoint GET /api/v1/kit/{id}

  Scenario: Buscar um kit pelo ID
    Given um kit com ID válido
    When eu envio uma requisição GET para "/api/v1/kit/{id}"
    Then a resposta deve ser 200 OK

  Scenario: Buscar um kit pelo ID que não existe
    Given um ID de kit que não existe
    When eu envio uma requisição GET para "/api/v1/kit/{id}"
    Then a resposta deve ser 404 Not Found

  Scenario: Buscar um kit com ID vazio
    Given um ID de kit vazio
    When eu envio uma requisição GET para "/api/v1/kit/{id}"
    Then a resposta deve ser 400 Bad Request

  Scenario: Buscar um kit com letras no ID
    Given um ID de kit com letras
    When eu envio uma requisição GET para "/api/v1/kit/{id}"
    Then a resposta deve ser 400 Bad Request

  Scenario: Buscar um kit com símbolos no ID
    Given um ID de kit com símbolos
    When eu envio uma requisição GET para "/api/v1/kit/{id}"
    Then a resposta deve ser 400 Bad Request
