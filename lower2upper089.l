%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[a-z]   { printf("%c", toupper(yytext[0])); }
[A-Z]   { printf("%c", tolower(yytext[0])); }
[\n]    { printf("\n"); }
.       { printf("%c", yytext[0]); }
%%

int main() {
    printf("Enter text:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

