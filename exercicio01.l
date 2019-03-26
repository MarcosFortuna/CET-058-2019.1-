/* 
Crie um Analisador Léxico utilizando Flex que consiga gerar os tokens
do arquivo de entrada "exercicio01.in" que consiste em um código na
linguagem C. O analisador deverá identificar todos os tokens referentes a:

1. Identificadores
2. Números Inteiros
3. Números de Ponto Flutuante
4. Palavras reservadas
5. Operadores Matemáticos e Relacionais
6. Chaves, Colchetes e Chaves

utilize os exemplos no diretório "flex" como ponto de partida.
*/
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

IDENTIFICADOR		[_a-zA-Z][_a-zA-Z0-9]*
NUMEROS_INTEIROS	-?[0-9]+
NUMEROS_DECIMAIS        -?[0-9]+\.[0-9]+
PALAVRAS_RESERVADAS  	"int"|"main"|"if"|"while"|"for"|"unsigned"
OPERADORES_MATEMATICOS  "+"|"-"|"/"|"*"|"^"|"!"
OPERADORES_RELACIONAIS  ">"|"<"|">="|"<="|"=="|"!="
ABERTURA_DE_ESCOPO      "("|"{"|"["
FECHAMENTO_DE_ESCOPO	")"|"]"|"}"

/*  FIM DA SEÇÃO DE DEFINIÇÕES*/

%%

{IDENTIFICADOR}  	 {printf("<identificador, %s>", yytext);contador++;}
{NUMEROS_INTEIROS}	 {printf("<numeros inteiros, %s>",  yytext); contador++;}
{NUMEROS_DECIMAIS}	 {printf("<numeros decimais, %s>", yytext);contador++;}
{PALAVRAS_RESERVADAS}	 {printf("<palavras reservadas, %s>", yytext);contador++;}
{OPERADORES_MATEMATICOS} {printf("<operadores matematicos, %s>", yytext);contador++;}
{OPERADORES_RELACIONAIS} {printf("<operadores relacionais, %s>", yytext);contador++;}	
{ABERTURA_DE_ESCOPO}	 {printf("<abetura de escopo, %s>", yytext);contador++;}
{FECHAMENTO_DE_ESCOPO}   {printf("<fechamento de escopo, %s>", yytext);contador++;}

%%

/*SEÇÃO DO CÓDIGO DO USUÁRIO*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de TOKENS.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}

