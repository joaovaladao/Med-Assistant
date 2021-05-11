## Papéis da Equipe

<table>
    <tr>
     <!-- Gabriel   -->
        <td align="center"><img style="border-radius: 50%;" src="https://i.pinimg.com/564x/d7/89/39/d789391751a7b1ef6b7d0ac0f713ba57.jpg" width="100px;" alt=""/><br /><sub><b>Gabriel Avelino</b><br><b>Product Owner/ Design</b></sub></a><br /></td>
     <!-- João Victor -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/57/fc/dd/57fcdd76f50f13c56b96d321583cf0e0.jpg"width="100px;" alt=""/>
        <br /><sub><b>João Victor Valadão</b><br><b>Scrum Master/ Desenvolvedor</b></sub></a><br /></td>
    <!-- Ítalo -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/10/c2/6b/10c26b34f105e6382c7ca89784053f68.jpg"width="100px;" alt=""/>
        <br /><sub><b>Ítalo Serra</b><br><b>Desenvolvedor/ Analista</b></sub></a><br /></td>
     <!-- Vinícius -->
        <td align="center">
        <img style="border-radius: 50%;" src="https://i.pinimg.com/564x/02/cd/1b/02cd1b63c02a96c6b847e80616f4cac5.jpg"width="100px;" alt=""/>
        <br /><sub><b>Vinícius Roriz</b><br><b>Desenvolvedor/ Arquiteto</b></sub></a><br /></td>
    </table>

## 1. Objetivo da _Sprint 12_

<p align="justify">Esta <i>Sprint</i> tem como objetivo:</p>

- Começar a trabalhar com os dias e os horários cadastrados e não mais os testes na aplicação;
- Criar um construtor para receber os dados das outras páginas;
- Configura o template da página de Histórico;
- Implementar funcionalidades para o calendário;
- Começar a implementar a página de configurações;
- Solucionar incompatibilidade entre as listas dinâmicas e listas de inteiros;



## 2. Tamanho da _Sprint_

| Data de Início | 03/05/2021 |
|:--|:--:|
| **Data de Término** | **10/05/2021** |
| **Duração** | **7 dias** |


## 3. Sprint Backlog

[Milestone](https://github.com/fga-eps-mds/MDS-2020-2-G9/milestone/12) da _Sprint_


## 4. Débitos Acumulados

Objetivos não alcançados em sprints passadas

- Sprint sem dependêcias

## Revisão

## 1. Relato da _Sprint_

<p align="justify">&emsp;&emsp; Essa Sprint foi destinada a implementar funções capazes de funcionar em segundo plano, mesmo se a aplicação estiver fechada.</p>


------------
## 2. Reuniões da _Sprint_ 
##### Data:
- 03/05/2021

##### _Temas Debatidos:_

-  Retiramos o arquivo de testes para substituir por valores digitados pelo usuário;

-  Como resgatar um valor que poderia ser usado para verificar o horário cadastrado;

-  Solucionar incompatibilidade de listas dinâmicas e listas de inteiros;

-  Como são criadas as funções super (__init __);

-  Criar uma função para verificar as notificações pendentes;

-  Criar uma função para deletar uma notificação pendente;

-  Criar um novo arquivo para organizar todos os dados do Local_Notification;


##### Progresso realizado: 

<p align="justify">&emsp;&emsp; Quando tentamos resgatar o valor do horário cadastrado, era apresentado incompatibilidade com a variável da classe alarme. Depois de resolvido, os dias eram tratados como uma lista dinâmica, o que resultou em conflitos com a página principal</p>

<p align="justify">&emsp;&emsp; Depois de alguns dias conseguimos reparar esses erros, porém o alarme só era disparado enquanto a aplicação estivesse aberta. Então foi necessário organizar os arquivos relacionados a "Notificação" em uma nova página, que foi configurada para rodar em segundo plano.</p>

------------

## 3. Pontos Positivos:

* Finalização da maioria das atividades propostas dentro do prazo estipulado;

* Implementamos funcionalidades que rodam em segundo plano (mesmo se a aplicação estiver fechada);

* Implementamos as notificações diárias;

-----------

## 4. Pontos Negativos:

* A maioria dos integrantes tem mais de uma função no projeto devido a baixa quantidade de integrantes;

-----------

## 5. Burndown Chart
<p align = "center"> &emsp;&emsp; <img src="https://raw.githubusercontent.com/fga-eps-mds/MDS-2020-2-G9/70c8420c8c7c8e852c74844767f7ab4e3939b6fd/docs/Sprints/Gr%C3%A1ficos/Burn%20Down%20(7).jpeg">
</p>

-----------

## 6. Velocity tracking
<p align = "center"> &emsp;&emsp; <img src="https://raw.githubusercontent.com/fga-eps-mds/MDS-2020-2-G9/70c8420c8c7c8e852c74844767f7ab4e3939b6fd/docs/Sprints/Gr%C3%A1ficos/Velocity%20tracking%20(5).jpeg">
</p>

-----------

## 7. Conclusões (Scrum Master)

<p align="justify">&emsp;&emsp; Essa Sprint foi uma surpresa para nós, encontramos bugs que não faziamos ideia de como solucioná-los. Muita coisa teve de ser alterada nos arquivos principais, assim como "caminho" para a aplicação rodar. Mesmo assim conseguimos achar uma saída, e resolvemos todos os bugs, foi bem divertido ver essa parte do app funcionando.</p>