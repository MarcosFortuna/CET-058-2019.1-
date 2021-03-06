/* atividade http://osorio.wait4.org/oldsite/compil/tutoria/exercicios-lex-flex.pdf
Gerador de TOKENS para uma linguagem como a descrita abaixo
 00 - DELIMITADOR , : ; .
 01 - OPERADOR_RELACIONAL < > = >= <= => =< <>
 02 – OPERADOR_ARITMETICO + - * / SQR SQRT SIN COS TAN
 03 - PALAVRA_RESERVADA Begin End For Do If Then Else Elseif Endif While Repeat Until
 04 - TIPO_DADO Integer Real Float Double Char String Boolean
 05 – FUNCAO _nome (palavras começando com underscore)
 06 – VARIÁVEL $nome (palavras começando com um “$”)
 07 – TEXTO “texto” (strings delimitadas entre aspas “” )
 08 – NUMERO 123 (seqüência de dígitos formando um número inteiro, positivo ou negativo)
 09 – NOME nome (palavras compostas por uma seqüência de letras)
 10 – COMENTÁRIO # texto # (texto delimindado pelo “#”)
 99 – INVALIDO demais elementos não presentes nesta descrição */

/* SEÇÃO DE DEFINIÇÕES */

%{
    /*
        Definições que estarão disponíveis 
            - variáveis
            - constantes
        O que for aqui será copiado para o arquivo *.yy.c
    
        Variáveis declaradas aqui estarão acessível nas funções yylex() e 
        main().
    */
    int contador = 0;
%}

/* Definições de Nomes */

OPERADOR_ARITIMETICO "-"|"+"|"\/"|"*"|"SQR"|"SQRT"|"COS"|"TAN"|"SIN"
NUMERO              -?[0-9]+
IDENTIFICADOR       [_a-zA-Z][_a-zA-Z0-9]*  
OPERADOR_RELACIONAL "<"|">"|">="|"<="|"=>"|"=<"|"<>"
PALAVRA_RESERVADA   "Begin"|"End"|"For"|"Do"|"If"|"Else"|"Elseif"|"Endif"|"While"|"Repeat"|"Until"
TIPO_DADO	    "Interger"|"Real"|"Float"|"Double"|"Char"|"String"|"Boolean"
FUNCAO		    _IDENTIFICADOR
VARIAVEL	    $IDENTIFICADOR
TEXTO	      	    "\[.]*"\
COMENTARIO	    #[.]*#

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */
{IDENTIFICADOR}        {printf("<identificador, %s>", yytext); contador++;}
{OPERADOR_REALACIONAL}  {printf("<op_rel, %s>", yytext); contador++;}
{NUMERO}               {printf("<numero, %s>", yytext); contador++;}
{OPERADOR_ARITIMETICO} {printf("<op_arit, %s>", yytext); contador++;}
{PARAVRA_RESERVADA}    {printf("<pal_reser, %s>", yytext); contador++;}
{TIPO_DADO} 	       {printf("<tipo_dado, %s>", yytext); contador++;}	
{FUNCAO}		{printf("<funcao, %s>", yytext); contador++;}
{VARIAVEL}		{printf("<variavel, %s>", yytext); contador++;}
{TEXTO}			{printf("<texto, %s>", yytext); contador++;}
{COMENTARIO}		{printf("<comentario, %s>", yytext); contador++;}
<<EOF>>                return 0;
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}
