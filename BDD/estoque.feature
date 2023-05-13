#language: pt

Funcionalidade: Estoque de produtos da empresa

    Como usuário do serviço de gestão da minha empresa
    Eu desejo cadastrar, atualizar, deletar e consultar os produtos que vendo em minha empresa 
    Relacionando cada um dos segmentos com os respectivos produtos, e atrelando a ele a data em que entrou em estoque

    Contexto: Gero o token de autenticação e repasso ao serviço para efetivar minha autenticação e autorização
        Dado que acesso a página de estoque do meu sistema e gero o token conforme definido em "src/resource/massateste/geradorToken"

        Cenário: Cadastrar um produto no estoque
           Quando chamo o método de cadastro da rota de estoques da API de Produto, informando no Payload da Requisição o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça azul do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13"
           Então o serviço me retorna o statusCode 201
           E um payload de retorno informando os dados cadastrados: o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça azul do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13"

        Cenário: Consultar um produto no estoque pelo seu código
           Quando chamo o método de consulta de produto da rota de estoques da API de Produto, informando o código do produto "CLMS12" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados do produto: o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça azul do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13" 

        Cenário: Consultar os produtos no estoque pelo seu segmento
           Quando chamo o método de consulta de segmento da rota de estoques da API de Produto, informando o código do segmento "IFMS12" em seu pathParameter e no queryparameter o número da página 1 e quantidade de registros 20 que se deseja para a página de retorno
           Então o serviço me retorna o statusCode 206
           E um payload de retorno informando uma lista páginada de todos os produtos pertencente ao segmento: o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça azul do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13" 
           E acrescido a este payload de retorno é informado o numero da pagina atual 1, a quantidade de registros que ela contém 20, a quantidade total de registros para o segmento 1000 e a quantidade total de páginas 50 que há para o segmento nesta configuração de requisição

        Cenário: Consultar todos os produtos no estoque
           Quando chamo o método de consulta da rota de estoques da API de Produto, informando no queryparameter o número da página 1 e quantidade de registros 20 que se deseja para a página de retorno
           Então o serviço me retorna o statusCode 206
           E um payload de retorno informando uma lista páginada de todos os produtos em estoque: o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça azul do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13" 
           E acrescido a este payload de retorno é informado o numero da pagina atual 1, a quantidade de registros que ela contém 20, a quantidade total de registros para o segmento 1000 e a quantidade total de páginas 50 que há para o segmento nesta configuração de requisição

        Cenário: Alterar um produto no estoque
           Quando chamo o método de alteração da rota de estoques da API de Produto, com o código do produto "CLMS12" em seu pathParameter
           E no body da requisição os dados que se deseja alterar no produto: descrição "Calça verde do Mickey"
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados do produto: o código do produto "CLMS12", o código do segmento "IFMS12", sua descrição "Calça verde do Mickey", seu preço de venda R$ 120 reais, indicador se está em promoção "true", quantidade de itens no estoque 10 e sua data de registro no estoque "2022-05-13" 

        Cenário: Deletar um produto no estoque
           Quando chamo o método de deleção da rota de estoques da API de Produto, com o código do produto "CLMS12" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando a mensagem "Os dados solicitados foram excluídos com sucesso"