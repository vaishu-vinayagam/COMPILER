#removing white space lex code

%{
#include<stdio.h>
%}
%%
[ \t\n] {;}
[A-Z] {printf("%c",yytext[0]-('A'-'a'));}
[a-z] {printf("%c",yytext[0]-('a'-'A'));}
%%
int main(int argc, char * argv[])
{
  FILE *ptr=fopen(argv[1],"r");
  yyin=ptr;
  yylex();
  return 0;
}
int yywrap()
{
}
