%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN
%token EOL

%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS

%%

input:
    /* empty */
    | input line
;

line:
    expr EOL                { printf("Result: %d\n", $1); }
    | error EOL             { yyerrok; printf("Syntax error recovered. Please try again.\n"); }
;

expr:
    expr PLUS expr          { $$ = $1 + $3; }
    | expr MINUS expr       { $$ = $1 - $3; }
    | expr TIMES expr       { $$ = $1 * $3; }
    | expr DIVIDE expr      {
        if ($3 == 0)
        {
            printf("Error: Division by zero\n");
            $$ = 0;
        }
        else
        {
            $$ = $1 / $3;
        }
    }
    | LPAREN expr RPAREN    { $$ = $2; }
    | MINUS expr %prec UMINUS { $$ = -$2; }
    | NUMBER                { $$ = $1; }
;

%%

void yyerror(const char *s) {
    printf("Syntax error: %s\n", s);
}

int main(void) {
    printf("Simple Calc\n");
    yyparse();
    return 0;
}

