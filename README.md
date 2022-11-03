# CORELAN API

Está é uma api é uma solução para o desafio da CORELAN.

# Cenário

A loja Devise Informática deseja disponibilizar em seu site a opção Monte seu Computador
onde seus clientes podem montar um computador pessoal (desktop) sob demanda escolhendo
as peças disponíveis que irão compor o computador e a loja irá se responsabilizar pela
montagem, certificação (realização de testes) e envio ao cliente.
O cliente entra no site e pode selecionar as seguintes peças para montar o seu computador:
* Processador
* Placa Mãe
* Memória RAM
* Placa de vídeo
As demais peças que compõem o computador serão selecionadas pela própria loja e o cliente
não precisa especificá-las.

# Validações
 
 O desafio exige as seguintes validações:
 
* Processador: É possível selecionar apenas um processador por máquina .
* Placa Mãe: É possível selecionar apenas uma placa mãe por máquina. A placa mãe deve suportar a marca (AMD ou Intel) do processador escolhido.
* Ram: A máquina deve ter pelo menos uma memória RAM. A quantidade total de memórias que podem ser escolhidas dependem da quantidade de slots de memória da placa mãe escolhida. A quantidade total de armazenamento (em GB) não deve superar o total de memória RAM suportado pela placa mãe.

* Placa de Vídeo: É possível selecionar apenas uma placa de vídeo para compor a máquina. Se a placa mãe escolhida não possui vídeo integrado, o cliente deve selecionar obrigatoriamente uma placa de vídeo. Caso contrário, selecioná-la é opcional.

# Requisitos

Requisitos que foram atendidos serão marcados com :heavy_check_mark: e os que não foram atendidos com :heavy_multiplication_x:

* :heavy_check_mark: O cliente monta sua máquina selecionando as peças disponíveis na loja e faz o seu pedido.
* :heavy_check_mark: O servidor, por sua vez, valida esse pedido conforme as Restrições de Montagem
* :heavy_check_mark: Sendo um pedido inválido, o servidor rejeita o pedido retornando os erros cometidos pelo cliente.
* :heavy_check_mark: Sendo um pedido válido, o servidor cria o pedido, armazenando-o na base de dados da loja, e retorna suas informações ao cliente
* :heavy_check_mark: autenticação/autorização
* :heavy_check_mark: Usuário cadastrado e obrigatório em cada pedido
* :heavy_check_mark: Testes Automatizados
* :heavy_check_mark: Documentar a API
* :heavy_check_mark: Criar endpoint para listar os todos os pedidos realizados, com opção para filtragem e/ou ordenação dos dados.
* :heavy_multiplication_x: Dockerizar a aplicação.
* :heavy_multiplication_x: Front-end Com react

# Preparações

Primeiramente rode rails db:setup, para crias as tabelas e popular os dados iniciais, caso prefira você pode rodar rails db:create -> rails db:migrate -> rails db:seed.

Na raiz do seu projeto crie o arquivo .env e dentro do arquivo coloque o seguinte texto:

API_SECRET='MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDV0KxWsLoYkx/L
u2l8Nc9xVT7FQTumGDHHxXNWpLNboZJOkUZh2rvNixdBul5neUhGNnox8ufF2+N6
XekgnTe0r5zKI5cwojAbIKFfZXNGpTEn3bHxqM5NaIfLCyRuJ+d7rCvaAvCyboqX
CfCMSsXMuLAKcQpf+qrtOEhMrn0HCrz/DHHlYxGyYEdkFvbM1NwD76Y5bogByYx9
HCUdiYmcbh1drAHkk66mwYuudVh3TbTWqDmYEqDZPKsY0+NVyCPJKzQkM1jM1JxP
qOPZiWrphzU3T9t9kDvA12l5l5JwnUtUTCDcihro96uiTVwksZ/aVA/n2nBxN8CW
Xk8KG84PAgMBAAECggEAE8STe/8iPXQAvECRlWSRaMKyWnqLYSUa5eoPhBx9e2r6
A8SMc5Vm+2JkKvU0yPx4ET6N8c2pqwVtrk1xAjOdR/NcG7FkE+1/mBdEt1t1GtXa
Y3t5YHfN/W8jVHZ6KESmzKxtPRGiuKrd3Yf50uao2FWs61I3KaROjQvakPUpS9WB
aRgLfmLLnGyO/pGMy0NQZW1jr+8e84kXk3v2uVHk873ByNeZVlALn+aXPcn1yvTF
SET8NoXgdO30Gy432lcjlkoLnE1IBaFB6wRbJdzraB7pA8tdDtRnbxGsTyKJ7arZ
TKrEsmzc/HQ85wunocJFtSQZ0qw5uN27U6Rnue4dWQKBgQD+YNO+6JudcBI7sIQA
gaRkTiatSqSlYv3diSnpM3Z2kKIGr1yiG56Z/dcuoBHPWkvdPPZU6eBOUSqFrw0d
wY8W6WofwsFlBdzjNpjOwnXNBkmIrIFgTr09tgv780pvnFCUhzI8fOdaNk2JdFY+
/oQmIDTusHh6weUvbAeyOcciZwKBgQDXLaSG9gpmck1+5F8cEKr2RQx0S3b5NZGl
y0QI7m4FEFsM7wncO7xcr8A/FaW68Epys0QqTgFa29yUVybCYM797t2oaWa3grin
WGbR5fug0XG83zCvn+Ad7O+YXcS03i3FbXkEMVS1BftHBc7Yis0e1CkElH8Zn5yM
SEaTWje+GQKBgQCx6+nO+wV1LiEirMj3TbY9DkiRJsdYgo/MNxcgbIVsUqdxg5CI
NkdNsDWlAALVBHRRr0UgiWEBhlX2oUTMTkkWHnbC9kassVgZeGOTIoKgv8gJF5d6
VDibBE0Hkdi7jhryeEmT800iVR8QiFWWxBCMVjSPytDKE/qIm8gaSb1V+wKBgQCV
PVTVPiRsdW6GScIlZvIMKEvBBO4ZXiwMP3SKdUPdQ0DDMa83Dj9QUZ0Wo970TuBz
uR3X8Y5DBCZyxBdfzWEDAf6+ZYwWTxXfCxMVFVt2aI1oH6xWwp3gY4qxtKdPgqFg
QtMiM0y62NE0qzSRP4OQlDl2sb+NeARNz3sTjAkJUQKBgC5BYZ/5AE7ZQxwmHpY8
MC60+UxgZMZjnfCV/ktLDbOYq7zdBYvAqm6SX5Oi5gNb+RomVd/1tJY/om5IEhfy
ty0OUN6GaA/fUktfKFRD5tDK2LtaPsJ4oxeYlCFP0d5iIMtajjmNWWg/SCNsjsF5
5fdTPTi148YRcOPbrDe6MKtE'

Você pode gerar outro codigo desde que ele esteja criptografado na base HS256.

# Usuário

A tabela de usuário é bem simples contendo apenas email e password, apos você realizar o cadastro do usuario o servidor vai devolver um token, guarde ele pois você vai precisar passar ele no Header quando for acessar as rotas do pedido .

# Pedido 

Está é a tabela central da api, quando for fazer qualquer interação com ela crie um header com o seguintes valores:
{Authorization:
    TOKEN DO USUARIO
}.

O pedido contêm uma tabela aninhada a ele, portanto quando você for mandar os parametros vai precisar seguir o formato abaixo: 

{
	"user_id": 1,	
	"order_products_attributes": [
    { "product_id": 1},
    { "product_id": 5},
    { "product_id": 8},
    { "product_id": 13}
	]
}

# Produtos

Segue a lista de product_id para você enviar pela a API: 

|       ID      |    PRODUTO    |    CATEGORY   |
|---------------|---------------|---------------|
|       1       |    CORE I5    |     CPU       |
|       2       |    CORE I7    |     CPU       |
|       3       |    RYZEN 5    |     CPU       |
|       4       |    RYZEN 7    |     CPU       |
|       5       |    ASUS ROG   |   PLACA MÃE   |
|       6       |    AORUS      |   PLACA MÃE   |
|       7       |    ASROCK     |   PLACA MÃE   |
|       8       |    HYPERX 4GB |     RAM       |
|       9       |    HYPERX 8GB |     RAM       |
|       10      |   HYPERX 16GB |     RAM       |
|       11      |   HYPERX 32GB |     RAM       |
|       12      |   HYPERX 64GB |     RAM       |
|       13      |  RTX 2060 6GB |     GPU       |
|       14      |  RTX 3060 6GB |     GPU       |
|       15      |  RX 6600 XT  |     GPU       |


# Notas

Caso você tenha algum problema com autenticação/autorização do usuário, você pode comentar o before_action :require_login


