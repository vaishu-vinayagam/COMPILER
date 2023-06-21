#lex code checking ipv6 address
%{
#include<stdio.h>
%}
%%
(([0-9a-fA-F]){0,4}\:){7}([0-9a-fA-F]){1,4} {printf("%s IS A VALID IPV6 ADDRESS",yytext);}
.+ {printf("%s IS AN INVALID IPV6 ADDRESS",yytext);}
%%
int yywrap(){}
int main()
{
   printf("ENTER A IPV6 ADDRESS\n");
   yylex();
   return 0;
}
