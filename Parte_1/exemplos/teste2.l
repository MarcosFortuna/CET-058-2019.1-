/* SEÇÃO DE DEFINIÇÕES */

%{
    
    int contador = 0;

%}
OCTAL		        0[0-7]+
HEXA		        [0][Xx][0-9A-Fa-f]+
DADOS                   "int"|"float"|"char"|"unsigned"|"long"|"short"|"double"|"signed"
NUMEROS_INTEIROS	-?[0-9]+
NUMEROS_DECIMAIS        -?[0-9]+\.[0-9]+
VARIAVEL		[_a-zA-Z][_a-zA-Z0-9]*
OPERADORES_MATEMATICOS  "+"|"-"|"/"|"*"
OPERADORES_RELACIONAIS  ">"|"<"|">="|"<="|"=="|"!="
ABERTURA_DE_ESCOPO      "("|"{"|"["
FECHAMENTO_DE_ESCOPO	")"|"]"|"}"
STRING			\"(\\.|[^"\\])*\"
/*os comentários e stirng estão funcionando tranquilamente*/
STRING			\"(\\.|[^"\\])*\" 
COMENTARIO		"//".*|"/*"(\\.|\\)*"*/" 
/*os dados estão funcionando normalmente*/
DEFERENCIAMENTO    "->"|"."

%%
{NUMEROS_INTEIROS}	 {printf("<numeros inteiros, %s>\n",  yytext); contador++;}
{NUMEROS_DECIMAIS}	 {printf("<numeros decimais, %s>\n", yytext);contador++;}
{STRING}                 {printf("<string, %s>\n", yytext);contador++;}
{COMENTARIO}             {printf("<comentario, %s>\n", yytext);contador++;}
{DADOS}                  {printf("<dados, %s>\n", yytext);contador++;}
{DEFERENCIAMENTO}        {printf("<dereferenciador, %s>\n", yytext);contador++;}
{OCTAL}		         {printf("<OCTAL, %s>\n", yytext);contador++;}
{HEXA}                   {printf("<HEXADECIMAL, %s>\n", yytext);contador++;}
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
