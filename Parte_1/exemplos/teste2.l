/* SEÇÃO DE DEFINIÇÕES */

%{
    
    int contador = 0;

%}

/*os comentários e stirng estão funcionando tranquilamente*/
STRING			\"(\\.|[^"\\])*\" 
COMENTARIO		"//".*|"/*"(\\.|\\)*"*/" 
/*os dados estão funcionando normalmente*/
DADOS           "int"|"float"|"char"|"unsigned"|"long"|"short"|"double"|"signed"
DEFERENCIAMENTO    "&"|"->"|"."|[\*]+
OCTAL		0[0-7]+
HEXA		[0][Xx][0-9A-Fa-f]+
%%

{STRING}      {printf("<string, %s>\n", yytext);contador++;}
{COMENTARIO}  {printf("<comentario, %s>\n", yytext);contador++;}
{DADOS}       {printf("<dados, %s>\n", yytext);contador++;}
{DEFERENCIAMENTO} {printf("<dereferenciador, %s>\n", yytext);contador++;}
{OCTAL}		  {printf("<OCTAL, %s>\n", yytext);contador++;}
{HEXA}            {printf("<HEXADECIMAL, %s>\n", yytext);contador++;}
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
