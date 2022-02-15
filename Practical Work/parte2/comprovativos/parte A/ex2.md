### Exercício 2 ###

![Prog 1](images/ex2_prog1.png)
![Prog 2](images/ex2_prog2.png)
![Prog 3](images/ex2_prog3.png)
![Prog 4](images/ex2_prog4.png)
![Prog 5](images/ex2_prog5.png)
![Prog 6](images/ex2_prog6.png)

Para executarmos o procedimento, precisamos de uma reserva que tenham efetuado check-in mas não o check-out. Nos dados
existentes não existe nenhuma reserva nesta situação, por isso vamos fazer com que duas fiquem:

![DML 1](images/ex2_dml1_51_52.png)

Resultado da query que busca todas as reservas com checkin efetuado, mas não checkout:

![Query 1](images/ex2_query1_51_52.png)
Todos os checkouts, respetiva fatura, e respetivas linhas de fatura foram apagados.

Esta query permite-nos visualizar todos os consumos (e respetivas quantidades) de todas as linhas de conta de consumo de
todas as contas de consumo da reserva 51:

![Query 2](images/ex2_query2_51.png)

Execução do procedimento através de um bloco anónimo:

![Bloco anónimo 1](images/ex2_bloco1_51.png)

Visualização de todas as faturas existentes:

![Query 3](images/ex2_query3_51.png)

O valor faturado em consumos está de acordo com o previsto. O valor faturado na reserva foi copiado da reserva para a
fatura, e também está de acordo com o que seria previsível.

Além disso, o estado da reserva também deverá ter sido atualizado:

![Query 4](images/ex2_query4_51.png)

E deverá ter sido adicionada uma linha à tabela checkout:

![Query 5](images/ex2_query5_51.png)

Tentemos correr o mesmo bloco anónimo outra vez, dando ao procedimento a reserva 51 novamente. Deverá provocar exceção,
já que não deve ser possível criar duas faturas para uma reserva.

![Bloco anónimo 2](images/ex2_bloco2_51.png)
É o resultado que se esperava.

Testemos também o comportamento do procedimento se for passada por parâmetro uma reserva que não tenha efetuado o
checkin:

![Bloco anónimo 3](images/ex2_bloco3_131.png)

O procedimento levantou a exceção, e a nova fatura não foi criada:

![Query 6](images/ex2_query6_51.png)

A única fatura que existe continua a ser a da reserva 51.
