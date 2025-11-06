%{
#include <stdio.h>
#include <string.h>

int cc = 0;    
int sc = 0;    
int lc = 0;    
int wc = 0;    
int cmc = 0;   
int kc = 0;    
int ic = 0;    

char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if", "int",
    "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
};

int is_keyword(char *word) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
[ \t]+                  { sc += yyleng; }
\n                      { lc++; }
"//".*                  { cmc++; }
"/\*([^*]|\*+[^*/])*\*+/" { cmc++; }
[a-zA-Z_][a-zA-Z0-9_]*  {
                          if (is_keyword(yytext))
                              kc++;
                          else
                              ic++;
                          wc++;
                          cc += yyleng;
                        }
[0-9]+                  { wc++; cc += yyleng; }
.                       { cc++; }
%%

int main() {
    printf("Enter code:\n");
    yylex();
    printf("\n--- Statistics ---\n");
    printf("Characters: %d\n", cc);
    printf("Spaces: %d\n", sc);
    printf("Lines: %d\n", lc);
    printf("Words: %d\n", wc);
    printf("Comments: %d\n", cmc);
    printf("Keywords: %d\n", kc);
    printf("Identifiers: %d\n", ic);
    return 0;
}

int yywrap() {
    return 1;
}

