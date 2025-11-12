%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
"+"         { return PLUS; }
"*"         { return STAR; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[a-zA-Z][a-zA-Z0-9]*   { return ID; }
\n          { return '\n'; }
.           { yyerror("Invalid Character"); }
%%

int yywrap() {
    return 1;
}
