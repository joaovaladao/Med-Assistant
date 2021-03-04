# Política de commits

---

* Commits devem ser redigidos em português no presente.
* Devem ser simples e concisos, possuindo títulos curtos de no máximo 72 caracteres.
* Devem ser compostos por #NUMERO_DA_ISSUE + MENSAGEM.

<b>Exemplo: </b>

``` 
#10 Adiciona documentação.
```

* Caso 2 ou mais pessoas tenham feito o trabalho, basta incluir a instrução ```Co-authored-by:```  na mensagem, para que eles sejam incluidos como contribuintes no gráfico de commits do GitHub.

<b>Exemplo: </b>

```
$ git commit -m "#10 Adiciona documentação.
>Co-authored-by: Chiquinho Gavião <queroFrango1942@gmail.com>"
```