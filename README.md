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
