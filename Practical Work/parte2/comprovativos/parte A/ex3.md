### Exercício 3 ###

Execução do trigger:

![Prog](images/ex3_prog.png)

Estas são as épocas existentes na base de dados:

![Query 1](images/ex3_query1.png)

Se tentarmos inserir uma nova época numa data que intercete noutra época, vai ser levanta-da uma exceção. Vemos isso
acontecer nesta imagem:

![DML 1](images/ex3_dml1.png)
A data que se tentou inserir colide com a da época de ID 4, e isso é explicado na mensagem da exceção.

E verifica-se que a época não foi adicionada:

![Query 2](images/ex3_query2.png)

No entanto, se inserirmos uma época com data válida...

![DML 2](images/ex3_dml2.png)

... o trigger não interfere:

![Query 3](images/ex3_query3.png)
