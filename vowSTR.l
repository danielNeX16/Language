%{
#include<stdio.h>
int count = 0;
%}

%%
[AEIOUaeiou] {count++;}
[\n] {yywrap();}
. {}
%%

int yywrap()
{
printf("No of vowels in given string is %d\n",count);
printf("\n");
count = 0;
return 0;
}

int main(){
    printf("Input Strings:\n");
    yylex();}