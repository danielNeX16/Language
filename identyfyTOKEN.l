%{
        #include <stdio.h>
        int stmt = 0;
        int kewd = 0;
        int inte = 0;
        int comp = 0;
        int asop = 0;
%}
%%

#.* { }

; { stmt++; }

auto |
break |
case |
char |
const |
continue |
default |
do |
double |
else |
enum |
extern |
float |
for |
goto |
if |
inline |
int |
long |
register |
restrict |
return |
short |
signed |
sizeof |
static |
struct |
switch |
typedef |
union |
void |
volatile |
while { kewd++; }

[0-9]+ { inte++; }

== |
>= |
> |
"<" |
"<=" |
!= { comp++; }

= { asop++; }

\n {}
. {}

%%

int main(int argc, char **argv) 
{
    extern FILE *yyin;
    int flag = 0;
    if (argc != 1 && argc != 2) 
    {
        yyin = stdin;
    }
    else if (argc == 1) 
    {
        yyin = stdin;
    } 
    else 
    {
        yyin = fopen(argv[1], "r");
    flag = 1;
    }

    yylex();
    printf("\n\t%d Statements.\n", stmt);
    printf("\t%d Keywords.\n", kewd);
    printf("\t%d Integers.\n", inte);
    printf("\t%d Comparison Ops.\n", comp);
    printf("\t%d Assignment Ops.\n", asop);
    if (flag) 
    {
        fclose(yyin);
    }
    return 0;
}

int yywrap() {
        return 1;
}
