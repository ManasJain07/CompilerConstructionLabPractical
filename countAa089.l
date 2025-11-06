%{
#include <stdio.h>
#include <ctype.h>

int count = 0;
%}

%%
[Aa][a-zA-Z0-9_]*      { count++; }
[a-zA-Z_][a-zA-Z0-9_]* { /* Other words */ }
[ \t\n]+               { /* Whitespace */ }
.                      { /* Ignore other characters */ }
%%

int main() {
    printf("Enter text:\n");
    yylex();

    printf("\nNo. of words: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}

