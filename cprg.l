#lex code for parsing cprogram
%{
#include<stdio.h>
%}
key "int "|"float "|"char "|"void "|do|else|return|include|bool
op "+"|"-"|"*"|"/"|"++"|"--"|">="|"<="|"="|"=="|"#"|"."|"<"|">"|"("|")"|"{"|"}"|","|";"|"%"
quote ["]
%%
{key} {printf("<keyword,%s>\n",yytext);}
"if"/"(" {printf("<keyword,%s>\n",yytext);}
"while"/"(" {printf("<keyword,%s>\n",yytext);}
"for"/"(" {printf("<keyword,%s>\n",yytext);}
{op} {printf("<operator,%s>\n",yytext);}
{quote} {printf("<operator,%s>\n",yytext);}
[a-zA-Z][a-zA-Z0-9]* {printf("<id,%s>\n",yytext);}
[0-9]+ {printf("<integer,%s>\n",yytext);}
. ;
%%
int yywrap(){}
int main(int argc,char *argv[])
{
  FILE *f=fopen(argv[1],"r");
  yyin=f;
  yylex();
  return 0;
}
