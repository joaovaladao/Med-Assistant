## Histórico de Versões
Data|Versão|Descrição|Autor
-|-|-|-
09/03|0.1|Abertura do Documento de Arquitetura|Thiago e Christian|
09/03|0.2|Adição de tópico sobre Flutter|Thiago e Christian|
09/03|0.3|Adição de tópico sobre Metas e Restrições de Arquitetura|Thiago e Christian|
21/03|0.4|Adição de tópico sobre Visão dos Casos de Uso|Thiago|

## 1 <a name="1">Introdução</a>
### 1.1 <a name="1_1">Finalidade</a>
<p align = "justify"> &emsp;&emsp; Este documento tem como objetivo apresentar uma visão geral sobre a arquitetura do MED Assistant. Aqui estarão presentes informações sobre as tecnologias utilizadas no projeto, modelo de arquitetura seguido e as motivações que guiam essas escolhas </p>

### 1.2 <a name="1_2">Escopo</a>
<p align = "justify"> &emsp;&emsp; Atráves desse documento, é possível obter um melhor entendimento da arquitetura do projeto, permitindo ao leitor a compreensão do funcionamento do sistem e as abordagens utilizadas para o seu desenvolvimento.</p>

### 1.3 <a name="1_3">Visão Geral</a>
* Introdução: Apresentar uma visão geral sobre o conteúdo dessa documentação;
* Tecnologias e arquitetura: Descreve as tecnologias e os padrões de arquitetura utilizados e informa as razões que motivaram tais escolhas;
* Metas e Restrições de Arquitetura: Fala sobre objetivos que buscam ser alcançados dentro da arquitetura escolhida;
* Visão dos Casos de Uso: Descreve as funcionalidades que o usuario poderá utilizar

## 2 <a name="2">Representação de Arquitetura</a>
### 2.1 <a name="2_1">Flutter</a>
<p align = "justify"> &emsp;&emsp; Para o desenvolvimento da interface do nosso aplicativo, foi escolhido o framework <a href="https://flutter.dev/">Flutter</a>, que utiliza a linguagem de programação <a href="https://dart.dev/">Dart</a>.</p>

<p align = "justify"> &emsp;&emsp; O <a href="https://flutter.dev/">Flutter</a> é um framework desenvolvido pelo Google, que possibilita a criação de aplicativos compilados de forma nativa com grande simplicidade e eficiência. Um diferencial do Flutter é a possibilidade de criação de aplicações multiplataforma, ou seja, a produção de um código capaz de rodar tanto no sistema Android quanto no sistema IOS com poucos ajustes.</p>

<p align = "justify"> &emsp;&emsp; Uma aplicação feita em <a href="https://flutter.dev/">Flutter</a>, é criada com base em um conjunto widgets que formam a interface do app. Cada widget possui uma funcionalidade, seja ela apenas visual ou interativa, os widgets são agrupados em uma estrutura de 'pai e filho', ou seja, um Widget pode conter dentro de si outros widgets, que desse modo, formam o layout desejado pelos desenvolvedores.</p>

## 3 <a name="3">Metas e Restrições de Arquitetura</a>
<p align = "justify">&emsp;&emsp; O aplicativo será desenvolvido para inicialmente para o sistema Android e suas funcionalidades básicas devem ser acessíveis de forma off-line.</p>

## 4 <a name="4">Visão dos Casos de Uso</a>
### 4.1 <a name="4_1">Visão Geral</a>
* Cadastrar Medicamento
* Editar Cadastro de Medicamento
* Deletar Cadastro de Medicamento
* Ver Cronograma de Medicamentos

### 4.2 <a name="4_2">Atores</a>
#### 4.2.1 <a name="4_2_1">Usuário</a>
<p align = "justify">&emsp;&emsp; Pessoa que fará o uso do aplicativo para organizar o seu uso de medicamentos.</p>

### 4.3 <a name="4_3">Descrição Significativa de Casos de Uso</a>

#### 4.3.1 <a name="4_3_1">Cadastrar Medicamento</a>
<p align = "justify">&emsp;&emsp; Esse caso de uso ocorre quando o usuário deseja cadastrar um novo medicamento, no cadastro serão salvas informaçoes como o nome do remédio, tipo do remédio (ex: comprimido, 10 ml), bem como informações de data como dia e horário em que o medicamento deve ser usado.</p>

#### 4.3.2 <a name="4_3_2">Editar Cadastro de Medicamento</a>
<p align = "justify">&emsp;&emsp; Esse caso de uso ocorre quando o usuário deseja alterar informações sobre um medicamento cadastrado anteriomente.</p>

#### 4.3.3 <a name="4_3_3">Deletar Cadastro de Medicamento</a>
<p align = "justify">&emsp;&emsp; Esse caso de uso ocorre quando o usuário deseja deletar o cadastro de um medicamento, serão apagadas todas as informações referentes ao medicamento selecionado.</p>

#### 4.3.4 <a name="4_3_4">Ver Cronograma de Medicamentos</a>
<p align = "justify">&emsp;&emsp; Esse caso de uso ocorre quando o usuário deseja navegar pelo histórico de uso dos seus medicamentos cadastrados, através da interface semelhante a um calendário serão listados todos os dias do mês, com destaque visual contrastante entre os dias em que o medicamento foi tomado e os dias que o medicamento não foi tomado corretamente.</p>








