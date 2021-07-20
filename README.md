# Pratica II LAOC-II
Prática II implementada na disciplina de Laboratório de Arquitetura e Organização de Computadores II do curso de Engenharia de Computação - CEFET/MG

Check List
=================

<!--ts-->
   * [Operações](#operacoes)
   * [Registradores](#registradores)
   * [Estágios habilitados](#estagios-habilitados)
   * [Modulos](#modulos)
     * [Regn](#regn)
     * [upCount](#upcount)
     * [mux](#mux)
<!--te-->


Operações
============

LD = carregar valor; <br />
ST = armazenar valor; <br />
MVNZ = move se não for zero; <br />
MV = conteúdo de registrador passa para o outro <br />
MVI = move um imediato para um registrador <br />
ADD = adiciona dois registradores <br />
SUB = subtrai dois registradores <br />
OR = operação lógica <br />
SLT = compara se um registrador é menor que outro <br />
SLL = move bits para esquerda <br />
SRL = move bits para direita <br />

``` cada instrução carrega 4 bits ```

|      Operações      |      Num bits       |
| ------------------- | ------------------- |
|         LD          |        0000         |
|         ST          |        0001         |
|        MVNZ         |        0010         |
|        MV           |        0011         |
|        MVI          |        0100         |
|        ADD          |        0101         |
|        SUB          |        0110         |
|         OR          |        0111         |
|        SLT          |        1000         |
|        SLL          |        1001         |
|        SRL          |        1010         |

Registradores
============
R0, R1, R2, R3, R4, R5, R6, R7, A. <br />
``` cada reg tem 16 bits ```


Estágios habilitados
============

Módulos:
[ x* ] dec3to8  <br />
[ ] MIF LPM  <br />
[ ] MIF Virtual  <br />
[ x ] Memória LPM  <br />
[ ] Memória Virtual  <br />
[ ] MODULO PRINCIPAL PRÁTICA 2  <br />
[ x* ] MUX  <br />
[ ] processador  <br />
[ x ] regN  <br />
[ x ] ULA  <br />
[ x* ] upcount  <br /> 
[ ] TLB  <br />


Modulos
============
Regn
-----
Módulo que tem a função de resertar o registrador passado como parâmetro ( 9 bits) ou atribui-lo a uma proxima instrução

upCount
-----
Módulo para contar os estágios


