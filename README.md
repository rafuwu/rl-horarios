# Rodoviária de Lisboa – Horários e mais

Coleção de scripts para transferir os horários antigos da Rodoviária de Lisboa.

## História

A [**Rodoviária de Lisboa**](https://www.rodoviariadelisboa.pt/horarios#tab0) juntou-se à **Carris Metropolitana (CM)**.

Os horários mudaram oficialmente no dia 1 de janeiro de 2023, assim como a numeração das carreiras.

### Notícias

* 28/12/2022 - Observador: [Carris Metropolitana começa a operar no distrito de Lisboa no domingo](https://observador.pt/2022/12/28/carris-metropolitana-comeca-a-operar-no-distrito-de-lisboa-no-domingo/)
* 01/01/2023 - Observador: [Carris Metropolitana começa hoje operar no distrito de Lisboa](https://observador.pt/2023/01/01/carris-metropolitana-comeca-hoje-operar-no-distrito-de-lisboa/)

> A rede vai seguir um novo sistema de numeração, pelo que mudarão, a partir de 01 de janeiro [de 2023], os números das carreiras atuais. É possível utilizar o “conversor de linhas” do ‘website’ da Carris Metropolitana para saber as novas referências.

> […] a Rodoviária de Lisboa, […] mantém o serviço em Loures, Odivelas, Mafra e Vila Franca de Xira ([“área 2”](https://area2.carrismetropolitana.pt/)), assegurando viagens intermunicipais com Lisboa.

## Ficheiros

### Scripts

* [**`transferir_horarios_exact.bash`**](./transferir_horarios_exact.bash)  
    Transfere os horários todos. Só transfere os horários que existem.
* [**`transferir_horarios_generic.bash`**](./transferir_horarios_generic.bash)  
    Script genérico para transferir todos os tipos de horários mesmo que não existam. Os que não existem são depois apagados.

### Listas

* [**`lista_carreiras.txt`**](./lista_carreiras.txt)  
    Lista de todas as carreiras com nomes.
* [**`lista_carreiras_numeros.txt`**](./lista_carreiras_numeros.txt)  
    Lista de todas as carreiras mas só os números.
* [**`lista_horarios_pngs.txt`**](./lista_horarios_pngs.txt)  
    Lista de todos os nomes de ficheiros das imagens dos horários.
