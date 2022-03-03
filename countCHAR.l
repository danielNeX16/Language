%{
#include<stdio.h>
int l=0, w=0,c=0;
%}
%%
[\n] { l++; w++;}
[\t ' '] w++;
[a-zA-Z] c++;
%%
void main()
{
yyin= fopen("Sample.txt","r");
yylex();
printf("\n\tWord Count: %d",w);
printf("\n\tLine Count: %d", l);
printf("\n\tCharacter Count: %d", c);
printf("\n");
}
int yywrap()
{
}