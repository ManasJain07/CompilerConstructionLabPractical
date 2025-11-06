%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+   {  
    int decNumber = atoi(yytext);
    printf("Decimal %s is Hexadecimal %X\n", yytext, decNumber);
}

[ \t\n]+  ;

.   {   
    printf("Unknown character: %s\n", yytext);
}

%%

int main() {
    printf("Enter decimal numbers:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

