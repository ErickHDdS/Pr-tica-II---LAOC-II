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
   * [Testes](#código-teste)
     * [Programa Principal](#programa-principal)  
     * [Loop](#loop)  
<!--te-->


Operações
============

LD = carregar valor; <br />
SD = armazenar valor; <br />
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
|         MV          |        0000         |
|         SD          |        0001         |
|        MVNZ         |        0010         |
|        LD           |        0011         |
|        MVI          |        0100         |
|        ADD          |        0101         |
|        SUB          |        0110         |
|         OR          |        0111         |
|        SLT          |        1000         |
|        SLL          |        1001         |
|        SRL          |        1010         |

Registradores
============
R0, R1, R2, R3, R4, R5, R6, R7, A, G. <br />
``` cada reg tem 16 bits ```


Estágios habilitados
============

Módulos:<br />
[ x ] dec3to8  <br />
[ x ] Memória LPM  <br />
[ x ] Counter LPM  <br />
[ x ] MUX  <br />
[ x ] processador  <br />
[ x ] regN  <br />
[ x ] ULA  <br />
[ x ] upcount  <br /> 
[ x ] TLB  <br />
[ x ] MIF LPM (caso teste)  <br />
[ x ] MIF Virtual  <br />
[ x ] Memória Virtual  <br />
[ x ] MODULO PRINCIPAL PRÁTICA 2  <br />


Modulos
============
counterlpm
-----

dec3to8
-----

instructionFetch
-----

MUX
-----

pratica2
-----

proc
-----

ramlpm
-----

regn
-----
Módulo que tem a função de resertar o registrador passado como parâmetro ( 9 bits) ou atribui-lo a uma proxima instrução

romlpm
-----

TLB
-----

ULA
-----

upcount
-----
Módulo para contar os estágios

Código teste:
============

Programa Principal
-----
16'b0100000000000000; // MVI R0, #2 <br />
16'b0000000000000010; // #2 <br />
16'b0100001000000000; // MVI R1, #3 <br />
16'b0000000000000011; // #3 <br />
16'b0101001000000000; // ADD R1,R0 <br />
16'b0100010000000000; // MVI R2, #6 <br />
16'b0000000000000110; // #6 <br />
16'b0110010001000000; // SUB R2, R1 <br />
16'b0000011001000000; // MV R3, R2 <br />
16'b0101000011000000; // ADD R0, R3 <br />
16'b0111001000000000; // OR R1, R0 <br />
16'b0110001000000000; // SUB R1, R0 <br />
16'b0101001011000000; // ADD R1, R3 <br />
16'b1001001011000000; // SLL R1, R3 <br />
16'b1010001011000000; // SRL R1, R3 <br />
16'b0100000000000000; // MVI R0, #0 <br />
16'b0000000000000000; // #0 <br />
16'b1000000001000000; // SLT R0, R1 <br />
16'b1000001001000000; // SLT R1, R1 <br />
16'b0100011000000000; // MVI R3, #3 <br />
16'b0000000000000011; // #3 <br />
16'b0100001000000000; // MVI R1, #5 <br />
16'b0000000000000101; // #5 <br />
16'b0101000011000000; // ADD R0, R3 <br />
16'b0100000000000000; // MVI R0, #0 <br />
16'b0000000000000000; // #0 <br />
16'b0011010011000000; // LD R2, R3 <br />
16'b0101010011000000; // ADD R2, R3 <br />
16'b0001010000000000; // SD R2, R0 <br />
16'b0011000000000000; // LD R0, R0 <br />
16'b0110000011000000; // SUB R0, R3 <br />
16'b0100000000000000; // MVI R0, #0 <br />
16'b0000000000000000; // #0 <br />
16'b0101000000000000; // ADD R0, R0 <br />
16'b0010000010000000; // MVNZ R0, R2 <br />
16'b0110001011000000; // SUB R1, R3 <br />
16'b0010000010000000; // MVNZ R0, R2 <br />
16'b0101000001000000; // ADD R0, R1 <br />

Loop
-----
16'b0100010000000000; <br />
16'b0000000000000001; <br />
16'b0100100000000000; <br />
16'b0000000000001010; <br />
16'b0000101111000000; <br />
16'b0110100010000000; <br />
16'b0010111101000000; <br />
