%{
#include<stdio.h>
%}
%%
[A-Za-z_][A-Za-z0-9_]*[\n] printf("Correct\n");
.* printf("InCorrect");
%%
int main()
{
yylex();
}
int yywrap()
{
return 1;
}