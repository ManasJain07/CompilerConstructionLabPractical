%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
    char* id;
}

%token <id> ID
%token <num> NUMBER
%token FOR LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN LT PLUS

%%

program:
    for_loop
    ;

for_loop:
    FOR LPAREN assignment SEMI condition SEMI assignment RPAREN LBRACE statements RBRACE
    {
        printf("Valid FOR loop detected.\n");
    }
    ;

assignment:
    ID ASSIGN expression
    ;

condition:
    ID LT expression
    ;

expression:
    ID
    | NUMBER
    | ID PLUS NUMBER
    | ID PLUS ID
    ;

statements:
    statement
    | statements statement
    ;

statement:
    assignment SEMI
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a FOR loop:\n");
    yyparse();
    return 0;
}

