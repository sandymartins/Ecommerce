#language: pt

Funcionalidade: Perfil de consumo dos clientes

    Como usuário do serviço de gestão da minha empresa
    Eu desejo criar segmentos que definam os produtos que possuo em estoque 
    Relacionando cada um dos segmentos com as compras realizadas pelos clientes e estabelecer seu perfil de consumo

    Contexto: Gero o token de autenticação e repasso ao serviço para efetivar minha autenticação e autorização
        Dado que acesso a página de perfil do meu sistema e gero o token conforme definido em "src/resource/massateste/geradorToken"

        Cenário: Cadastrar um segmento de consumo
           Quando chamo o método de cadastro da rota de segmentos da API de Perfil, informando no Payload da Requisição o código do segmento "IFMS12" e sua descrição "Moda Infantil Masculina para 12 anos"
           Então o serviço me retorna o statusCode 201
           E um payload de retorno informando os dados cadastrados: o código do segmento "IFMS12" e sua descrição "Moda Infantil Masculina para 12 anos"

        Cenário: Consultar um segmento de consumo
           Quando chamo o método de consulta da rota de segmentos da API de Perfil, informando o segmento "IFMS12" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados do segmento: o código do segmento "IFMS12" e sua descrição "Moda Infantil Masculina para 12 anos" 
        
        Cenário: Consultar o perfil de consumo de um cliente
           Quando chamo o método de consulta da rota de perfil da API de Perfil, informando o documento do cliente "43290190802" em seu pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando os dados de perfil do cliente: o documento do cliente "43290190802", uma lista de todos os códigos de segmentos que ele fez compra até hoje ["IFMS12", "IFMS11", "IFMS10"] e seu segmento mais comprado nos últmos 90 dias "IFMS12"
