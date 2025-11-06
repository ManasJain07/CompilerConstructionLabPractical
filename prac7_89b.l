%{
#include "prac7_89a.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[+\-*/]         { return *yytext; }
[ \t]           { /* ignore spaces */ }
\n              { return '\n'; }
.               { /* ignore other characters */ }
%%

