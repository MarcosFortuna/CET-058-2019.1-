/* SEÇÃO DE DEFINIÇÕES */

%{
    
    int contador = 0;
%}
NUMEROS_INTEIROS	-?[0-9]+
NUMEROS_DECIMAIS        -?[0-9]+\.[0-9]+
PALAVRAS_RESERVADAS"int"|"main"|"if"|"while"|"for"|"unsigned"|"include"|"define"|"const"|"void"|"return"|"exit"|"long"|"else"|"case"|"do"|"auto"|"break"|"continue"|"deafault"|"enum"|"goto"|"extern"|"register"|"short"|"sizeof"|"signed"|"typedef"|"struct"|"switch"|"union"|"volatile"	
VARIAVEL		[_a-zA-Z][_a-zA-Z0-9]*
OPERADORES_MATEMATICOS  "+"|"-"|"/"|"*"
OPERADORES_RELACIONAIS  ">"|"<"|">="|"<="|"=="|"!="
ABERTURA_DE_ESCOPO      "("|"{"|"["
FECHAMENTO_DE_ESCOPO	")"|"]"|"}"
STRING			\"(\\.|[^"\\])*\"
FL			";"
COMENTARIO		"//".*|"/*"(\\.|\\)*"*/"
/*  FIM DA SEÇÃO DE DEFINIÇÕES*/

%%

{VARIAVEL}  	         {printf("<identificador, %s>\n", yytext);contador++;}
{NUMEROS_INTEIROS}	 {printf("<numeros inteiros, %s>\n",  yytext); contador++;}
{NUMEROS_DECIMAIS}	 {printf("<numeros decimais, %s>\n", yytext);contador++;}
{PALAVRAS_RESERVADAS}	 {printf("<palavras reservadas, %s\n>", yytext);contador++;}
{OPERADORES_MATEMATICOS} {printf("<operadores matematicos, %s\n>", yytext);contador++;}
{OPERADORES_RELACIONAIS} {printf("<operadores relacionais, %s\n>", yytext);contador++;}	
{ABERTURA_DE_ESCOPO}	 {printf("<abetura de escopo, %s>\n", yytext);contador++;}
{FECHAMENTO_DE_ESCOPO}   {printf("<fechamento de escopo, %s>\n", yytext);contador++;}
{STRING}		 {printf("<string, %s>\n", yytext);contador++;}
{FL}                     {printf("<string, %s>\n", yytext);contador++;}
{COMENTARIO}		 {printf("<string, %s>\n", yytext);contador++;}
<<EOF>>			 {return 0;}



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
