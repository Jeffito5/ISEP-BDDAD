### Exercício 1 ###

![Prog 1](images/ex1_prog1.png)
![Prog 2](images/ex1_prog2.png)
![Prog 3](images/ex1_prog3.png)
![Prog 4](images/ex1_prog4.png)

Pretende provar-se que, quando invocamos a função dando como parâmetro uma reserva sem checkin efetuado, esta vai
retornar o quarto do andar mais baixo, com o mínimo de dias de ocupação no último ano, e que não esteja ocupado no
período de estada da reserva enviada por parâmetro.

Esta reserva ainda não tem o checkin efetuado:

![Query 1](images/ex1_query1_6743.png)

Todos os quartos do tipo 3, ordenados pelo andar e pelo número de dias de ocupação no último ano:

![Query 2](images/ex1_query2_t3.png)

Todos os quartos do tipo 3 ocupados durante o período de estada da reserva 6743:

![Query 3](images/ex1_query3_t3_28_11_1_12.png)

Assim, espera-se que a função retorne o valor 21, já que os quartos 3, 6, 9 e 12 (que teriam prioridade de escolha por
serem de um andar inferior ou terem tido menos dias de ocupação no último ano) estão ocupados durante o período de
estada da reserva 6853. Aqui está um bloco anónimo que demonstra isso mesmo, e também testa as condições em que a função
deve retornar NULL:

![Bloco anónimo 1](images/ex1_bloco1_6743.png)
