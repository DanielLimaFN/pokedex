# Flutter Pokédex - Teste Prático para a Senior Sistemas

Este projeto de Pokédex, desenvolvido em Flutter, foi realizado como um teste prático para a Senior Sistemas.

## Tecnologias Utilizadas

• Flutter: O framework principal para o desenvolvimento do aplicativo.

• Dio: Uma poderosa biblioteca Dart para realizar requisições HTTP. No projeto, Dio é utilizado para interagir com a API Pokémon.

• GetX: Um gerenciador de estado, navegação e dependências para Flutter. GetX é usado neste projeto para gerenciar o estado da aplicação de maneira reativa e eficiente, além de facilitar a navegação entre telas sem a necessidade de contexto.


## Estrutura do Projeto
O projeto segue o padrão MVC (Model-View-Controller), organizado da seguinte maneira:

• Model: Contém as definições dos modelos de dados, como Pokemon e PokeInfo, que representam as estruturas de dados da API Pokémon.

• View: Inclui os widgets e telas que compõem a interface do usuário. Exemplos incluem a HomeView e a PokemonDetailsView.

• Controller: Contém os controladores do GetX, como PokemonController, que gerenciam a lógica de negócios e o estado da aplicação.

• Services: Inclui serviços como ApiService, que utiliza Dio para realizar as requisições HTTP à API Pokémon.


## License

[MIT](https://choosealicense.com/licenses/mit/)
