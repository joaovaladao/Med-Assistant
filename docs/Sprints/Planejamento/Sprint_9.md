## Papéis da Equipe

<table>
    <tr>
     <!-- Gabriel   -->
        <td align="center"><img style="border-radius: 50%;" src="https://i.pinimg.com/564x/26/22/fe/2622fe9807328d1659a620ed3792998d.jpg" width="100px;" alt=""/><br /><sub><b>Gabriel Avelino</b><br><b>Product Owner/ Design</b></sub></a><br /></td>
     <!-- João Victor -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/bd/e2/5d/bde25df405ee9ce34108c934a313ba2a.jpg"width="100px;" alt=""/>
        <br /><sub><b>João Victor Valadão</b><br><b>Scrum Master/ Desenvolvedor</b></sub></a><br /></td>
    <!-- Ítalo -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/96/8c/34/968c34a8a8c10eae152d2900a870c521.jpg"width="100px;" alt=""/>
        <br /><sub><b>Ítalo Serra</b><br><b>Desenvolvedor/ Analista</b></sub></a><br /></td>
     <!-- Vinícius -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/f3/e7/c3/f3e7c3129cfde2c52fa2bfb483b1727f.jpg"width="100px;" alt=""/>
        <br /><sub><b>Vinícius Roriz</b><br><b>Desenvolvedor/ Arquiteto</b></sub></a><br /></td>
    </table>

## 1. Objetivo da _Sprint 8_

<p align="justify">Esta <i>Sprint</i> tem como objetivo:</p>

- Definir o template da página "Histórico" para que posteriormente seja implementado as funcionalidades da página;
- Implementar o calendário da página "Histórico" e suas funcionalidades;
- Criar as páginas derivadas da página "Medicações";
- Configurar os botões que selecionam os dias da semana, para serem capazes de indicar mais de um dia;
- Implementar as notificações que irão aparecer no dispositivo, assim como qual pacote será usado e suas permissões;
- Implementar as notificações sonoras no dispositivo, assim como suas permissões;
- Escolher e começar a implementar um banco de dados para o aplicativo;



## 2. Tamanho da _Sprint_

| Data de Início | 12/04/2021 |
|:--|:--:|
| **Data de Término** | **19/04/2021** |
| **Duração** | **7 dias** |


## 3. Sprint Backlog

[Milestone](https://github.com/fga-eps-mds/MDS-2020-2-G9/milestone/9) da _Sprint_


## 4. Débitos Acumulados

Objetivos não alcançados em sprints passadas

- Estudar e implementar banco de dados foi mais trabalhoso que o esperado e será necessário mais uma Sprint;

## Revisão

## 1. Relato da _Sprint_

<p align="justify">&emsp;&emsp; O foco dessa Sprint foi a implementação dos pacotes que estão sendo utilizados na aplicação, o banco de dados e as notificações locais. Assim, grande parte dos arquivos "base" tiveram que ser modificados, o que causou alguns problemas nas páginas e funções já criadas.</p>


------------
## 2. Reuniões da _Sprint_ 
##### Data:
- 12/04/2021

##### _Temas Debatidos:_

-  O documento de riscos não estava sendo utilizado ao longo das Sprints;

-  Qual pacote seria utilizado para implementar as notificações locais;

-  Quais permissões eram necessárias para instalar esse pacote, e como implementa-las;

-  Onde as informações deviam ser pesquisadas (https://api.flutter.dev/flutter/material);

-  Qual pacote seria utilizado para implementar o banco de dados;

-  Iniciar o GitHub Actions para automatizar os testes no repositório;

-  Criar as funções necessárias para iniciar e salvar valores no banco de dados;

-  Trocar o testes pelos valores cadastrados no SQlite, de forma que a aplicação continue funcionando;

##### Progresso realizado: 

<p align="justify">&emsp;&emsp; Ficou decidido que usaremos o pacote (sqflite: ^1.3.0) para o banco de dados, e o pacote (flutter_local_notifications: ^1.4.4+2) para as notificações.</p>

<p align="justify">&emsp;&emsp; Assim que implementado, novos erros apareceram na aplicação, e ficamos responsáveis por corrigi-los.</p>

------------

## 3. Pontos Positivos:

* Finalização das atividades propostas dentro do prazo estipulado;

* Conseguimos instalar todos os pacotes pendentes;

* Corrigimos todos os erros que apareceram na instalação dos pacotes;

* Implementamos o GitHub Actions;

-----------

## 4. Pontos Negativos:

* A maioria dos integrantes tem mais de uma função no projeto devido a baixa quantidade de integrantes;

-----------

## 5. Burndown Chart
<p align = "center"> &emsp;&emsp; <img src="https://raw.githubusercontent.com/fga-eps-mds/MDS-2020-2-G9/e53e86ccb39d5bbc8e8a32bfdc819c1deca075d3/docs/Sprints/Gr%C3%A1ficos/Burn%20Down%20(5).jpeg">
</p>

-----------

## 6. Velocity tracking
<p align = "center"> &emsp;&emsp; <img src="https://raw.githubusercontent.com/fga-eps-mds/MDS-2020-2-G9/e53e86ccb39d5bbc8e8a32bfdc819c1deca075d3/docs/Sprints/Gr%C3%A1ficos/Velocity%20tracking%20(3).jpeg">
</p>

-----------

## 7. Conclusões (Scrum Master)

<p align="justify">&emsp;&emsp; Essa foi uma Sprint mais importante para o backlog da aplicação, e ver a aplicação rodando como um app que realmente funciona, me deixou muito feliz. Nossa equipe não teve o melhor desempenho na primeira release, mas na próxima vamos nos destacar. Avengers, assemble!</p>