/* SEÇÃO DE DEFINIÇÕES */

%{
    
    int contador = 0;

%}
OCTAL		        0[0-7]+
HEXA		        [0][Xx][0-9A-Fa-f]+
DADOS                   "int"|"float"|"char"|"unsigned"|"long"|"short"|"double"|"signed"|"void"
CONDICIONAL		"if"|"else"
CASE_CONTROL	        "switch"|"continue"|"break"|"goto"
STRUCT		        "struct"|"typedef"|"union"
LOOP			"while"|"for"|"do"
STORAGE_TYPES		"auto"|"register"|"extern"|"static"
KEYWORDS		"enum"|"const"|"default"|"sizeof"|"volatile"|"return"
NUMEROS_INTEIROS	-?[0-9]+
NUMEROS_DECIMAIS        -?[0-9]+\.[0-9]+
VARIAVEL		[_a-zA-Z][_a-zA-Z0-9]*
OPERADORES_LOGICOS 	"&&"|"||"|"!"
OPERADORES_BIT		"&"|"|"|"^"|"~"|"<<"|">>"
OPERADORES_ATRIBUICAO   "+="|"-="|"/="|"="|"^="|"%="|"*="|"&="
OPERADOR_INCR		"--"|"++"
OPERADORES_MATEMATICOS  "+"|"-"|"/"|[\*]+
OPERADORES_RELACIONAIS  ">"|"<"|">="|"<="|"=="|"!="
OPERADOR_TERNARIO	"?"|":"
ABERTURA_DE_ESCOPO      "("|"{"|"["
FECHAMENTO_DE_ESCOPO	")"|"]"|"}"
ENDLINE			";"
/*os comentários e stirng estão funcionando tranquilamente*/
STRING			\"(\\.|[^"\\])*\" 
COMENTARIO		"//".*|"/*"(\\.|\\)*"*/" 
/*os dados estão funcionando normalmente*/
DEFERENCIAMENTO         "->"|"."

%%
{OCTAL}		         {printf("<OCTAL, %s>\n", yytext);contador++;}
{HEXA}                   {printf("<HEXADECIMAL, %s>\n", yytext);contador++;}
{DADOS}                  {printf("<dados, %s>\n", yytext);contador++;}
{CONDICIONAL}		 {printf("<condicional, %s>\n", yytext);contador++;}
{CASE_CONTROL}           {printf("<case_control, %s>\n", yytext);contador++;}
{STRUCT}		 {printf("<struct, %s>\n", yytext);contador++;}
{LOOP}			 {printf("<loop, %s>\n", yytext);contador++;}
{STORAGE_TYPES}          {printf("<storage_type, %s>\n", yytext);contador++;}
{KEYWORDS} 	  	 {printf("<keyword, %s>\n", yytext);contador++;}
{NUMEROS_INTEIROS}	 {printf("<numeros inteiros, %s>\n",  yytext); contador++;}
{NUMEROS_DECIMAIS}	 {printf("<numeros decimais, %s>\n", yytext);contador++;}
{VARIAVEL}  	         {printf("<identificador, %s>\n", yytext);contador++;}
{OPERADORES_LOGICOS}     {printf("<operador_logico, %s>\n", yytext);contador++;}
{OPERADORES_BIT}         {printf("<bitewise, %s>\n", yytext);contador++;}
{OPERADORES_ATRIBUICAO}  {printf("<atribuição, %s>\n", yytext);contador++;}
{OPERADOR_INCR}          {printf("<operador_incr, %s>\n", yytext);contador++;}
{OPERADORES_MATEMATICOS} {printf("<operadores matematicos, %s\n>", yytext);contador++;}
{OPERADORES_RELACIONAIS} {printf("<operadores relacionais, %s\n>", yytext);contador++;}	
{OPERADOR_TERNARIO}      {printf("<ternario, %s>\n", yytext);contador++;}
{ABERTURA_DE_ESCOPO}	 {printf("<abetura de escopo, %s>\n", yytext);contador++;}
{FECHAMENTO_DE_ESCOPO}   {printf("<fechamento de escopo, %s>\n", yytext);contador++;}
{ENDLINE}		 {printf("<endline, %s>\n", yytext);contador++;}
{STRING}                 {printf("<string, %s>\n", yytext);contador++;}
{COMENTARIO}             {printf("<comentario, %s>\n", yytext);contador++;}
{DEFERENCIAMENTO}        {printf("<dereferenciador, %s>\n", yytext);contador++;}

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
