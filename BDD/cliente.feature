#language: pt

Funcionalidade: Clientes da empresa

    Como usuário do serviço de gestão da minha empresa
    Eu desejo cadastrar, atualizar, deletar e consultar os clientes da minha empresa 

    Contexto: Gero o token de autenticação e repasso ao serviço para efetivar minha autenticação e autorização
        Dado que acesso a página de clientes do meu sistema e gero o token conforme definido em "src/resource/massateste/geradorToken"

        Cenário: Cadastrar um clientes
           Quando chamo o método de cadastro da API de Clientes, informando no Payload da Requisição o documento do cliente "43290190802", seu nome "João Miguel", sua data de nascimento "2022-08-24", seu endereço "Rua Exemplo 2023", indicador de cliente ativo "true" e sua data de registro no sistema "2023-01-01"
           Então o serviço me retorna o statusCode 201
           E um payload de retorno informando os dados cadastrados: o documento do cliente "43290190802", seu nome "João Miguel", sua data de nascimento "2022-08-24", seu endereço "Rua Exemplo 2023", indicador de cliente ativo "true" e sua data de registro no sistema "2023-01-01"

        Cenário: Consultar um cliente
           Quando chamo o método de consulta da API de Clientes, informando o documento do cliente "43290190802" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados cadastrados: o documento do cliente "43290190802", seu nome "João Miguel", sua data de nascimento "2022-08-24", seu endereço "Rua Exemplo 2023", indicador de cliente ativo "true" e sua data de registro no sistema "2023-01-01"

        Cenário: Alterar um cliente
           Quando chamo o método de alteração da API de Clientes, informando o documento do cliente "43290190802" em seu pathParameter
           E no body da requisição os dados que se deseja alterar no cliente: nome "João Miguel Fonseca"
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados cadastrados: o documento do cliente "43290190802", seu nome "João Miguel Fonseca", sua data de nascimento "2022-08-24", seu endereço "Rua Exemplo 2023", indicador de cliente ativo "true" e sua data de registro no sistema "2023-01-01"

        Cenário: Desativar o relacionamento de um Cliente
           Quando chamo o método de encerramento de relacionamento da API de Clientes, informando o documento do cliente "43290190802" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados cadastrados: o documento do cliente "43290190802", seu nome "João Miguel Fonseca", sua data de nascimento "2022-08-24", seu endereço "Rua Exemplo 2023", indicador de cliente ativo "false" e sua data de registro no sistema "2023-01-01"
