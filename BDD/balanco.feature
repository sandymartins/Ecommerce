#language: pt

Funcionalidade: Balanço de vendas dos clientes

    Como usuário do serviço de gestão da minha empresa
    Eu desejo poder registrar as vendas que realizei para os meus clientes e abater itens do estoque a cada venda realizada

    Contexto: Gero o token de autenticação e repasso ao serviço para efetivar minha autenticação e autorização
        Dado que acesso a página de vendas do meu sistema e gero o token conforme definido em "src/resource/massateste/geradorToken"

        Cenário: Realizar uma venda
           Quando chamo a rota de vendas da API de Balanço, informando no Payload da Requisição o código do produto "CLMS12", o documento do cliente que realizou a compra "43290190802", quantidade de produtos vendidos 1 e o valor da venda R$ 110 reais
           Então o serviço me retorna o statusCode 201
           E um payload de retorno informando os dados cadastrados: o código do produto "CLMS12", o documento do cliente que realizou a compra "43290190802", quantidade de produtos vendidos 1, o valor da venda R$ 110 reais, o indicador de devolução "false" e o lucro sobre a operação -10 reais
           E realiza-se a redução da quantidade de itens vendidos 1 da quantidade de peças disponiveis no estoque de produtos para o produto "CLMS12", de 10 peças para 9 peças

        Cenário: Devolução de produtos
           Quando chamo o método de devolução da API de Balanço, informando no Payload da Requisição o código do produto "CLMS12", quantidade de itens devolvidos 1 e o documento do cliente que realizou a compra "43290190802"
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados cadastrados: o código do produto "CLMS12", o documento do cliente que realizou a compra "43290190802", quantidade de produtos vendidos 1, o valor da venda R$ 110 reais, o indicador de devolução "true" e o lucro sobre a operação -10 reais
           E realiza-se o incremento da quantidade de itens devolvidos 1 na quantidade de peças disponiveis no estoque de produtos para o produto "CLMS12", de 9 peças para 10 peças

