%{
#include <stdio.h>
%}

%%
.*com { printf("Line ends with 'com': %s\n", yytext); }
.* { /* Ignore other lines */ }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
