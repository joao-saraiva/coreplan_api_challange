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
