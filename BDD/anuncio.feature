#language: pt

Funcionalidade: Anuncios ao cliente

    Como usuário do serviço de gestão da minha empresa
    Eu desejo poder, de forma automática, selecionar os produtos que melhor se encaixem a cada cliente, com base em seu histórico e nos produtos marcados como em promoção, e anunciar aos clientes

    Contexto: Gero o token de autenticação e repasso ao serviço para efetivar minha autenticação e autorização
        Dado que acesso a página de anuncios do meu sistema e gero o token conforme definido em "src/resource/massateste/geradorToken"

        Cenário: Emite um anuncio
           Quando chamo a rota de anuncios da API de Anuncio, informando o documento do cliente "43290190802" no pathParameter
           Então o serviço me retorna o statusCode 200
           E um payload de retorno informando uma lista de códigos de produtos para anuncio, baseados no perfil do cliente que neste caso é "IFMS12" e para este perfil, aqueles produtos que estão em promoção: ["CLMS12"]
