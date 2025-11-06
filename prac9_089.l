%{
#include "prac9_089a.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

digit   [0-9]
id      [a-zA-Z_][a-zA-Z0-9_]*

%%
"FOR"       { return FOR; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMI; }
"="         { return ASSIGN; }
"<"         { return LT; }
"+"         { return PLUS; }
{digit}+    { yylval.num = atoi(yytext); return NUMBER; }
{id}        { yylval.id = strdup(yytext); return ID; }
[ \t\r\n]   ; // Ignore whitespace
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

