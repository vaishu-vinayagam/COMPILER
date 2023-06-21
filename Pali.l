#lex code checking for palindrome
%{
#include<stdio.h>
int i,j,r,count=0;
int palin(char[],int);
%}
%%
[a-zA-Z0-9]* {r=palin(yytext,yyleng);
              if(r==1)
                 count++;
             }
.;
%%
int palin(char s[],int n)
{
  for(i=0,j=n-1;i<=j;i++,j--)
  {

    if(s[i]==s[j])
    {
      if(i==j || j>i)
      {
        printf("<palindrome,%s>",yytext);
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }

}
int yywrap(){}
int main(int argc,char *argv[])
{
   FILE *fp=fopen(argv[1],"r");
   yyin=fp;
   yylex();
   printf("TOTAL NUMBER OF PALINDROMES IS %d",count);
   return 0;
}
