## Histórico de Versões

Data|Versão|Descrição|Autor
-|-|-|-
09/03|0.1|Abertura do Documento de Arquitetura|Thiago e Christian|
09/03|0.2|Criação de tópico sobre Flutter|Thiago e Christian|
09/03|0.3|Criação de tópico sobre Metas de Arquitetura|Thiago e Christian|


## 1. Introdução

### 1.1 Escopo

<p align = "justify"> &emsp;&emsp; Este documento tem como objetivo apresentar uma visão geral sobre a arquitetura do Aplicativo de Medicamentos. Aqui estarão presentes informações sobre as tecnologias utilizadas no projeto, modelo de arquitetura seguido e as motivações que guiam essas escolhas </p>


### 1.2 Visão Geral

* Introdução: Apresentar uma visão geral sobre o conteúdo dessa documentação;
* Tecnologias e arquitetura: Descreve as tecnologias e os padrões de arquitetura utilizados e informa as razões que motivaram tais escolhas;
* Metas de arquitetura: Fala sobre objetivos que buscam ser alcançados dentro da arquitetura escolhida;


## 2. Tecnologias e arquitetura

### 2.1 Flutter

<p align = "justify"> &emsp;&emsp; Para o desenvolvimento da interface do nosso aplicativo, foi escolhido o framework <a href="https://flutter.dev/">Flutter</a>, que utiliza a linguagem de programação <a href="https://dart.dev/">Dart</a>.</p>

<p align = "justify"> &emsp;&emsp; O <a href="https://flutter.dev/">Flutter</a> é um framework desenvolvido pelo Google, que possíbilita a criação de aplicativos compilados de forma nativa com grande simplicidade e eficiência. Um diferencial do Flutter é a possibilidade de criação de aplicações multiplataforma, ou seja, a produção de um código capaz de rodar tanto no sistema Android quanto no sistema IOS com poucos ajustes.</p>

<p align = "justify"> &emsp;&emsp; Uma aplicação feita em <a href="https://flutter.dev/">Flutter</a>, é criada com base em um conjunto widgets que formam a interface do app. Cada widget possui uma funcionalidada, seja ela apenas visual ou interativa, os widgets são agrupados em uma estrutura de 'pai e filho', ou seja, um Widget pode conter dentro de si outros widgets, que desse modo, formam o layout desejado pelos desenvolvedores.</p>


## 3. Metas de Arquitetura


<p align = "justify">&emsp;&emsp; O aplicativo será desenvolvido para inicialmente para o sistema Android e suas funcionalidades básicas devem ser acessíveis de forma offline.</p>