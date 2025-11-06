%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}
%token NUMBER
%%
input:
        /* empty */
    |   input line
    ;

line:
        expr '\n'    { printf("Result = %d\n", $1); }
    ;

expr:
        NUMBER              { $$ = $1; }
    |   expr expr '+'       { $$ = $1 + $2; }
    |   expr expr '-'       { $$ = $1 - $2; }
    |   expr expr '*'       { $$ = $1 * $2; }
    |   expr expr '/'       { $$ = $1 / $2; }
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main() {
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}

