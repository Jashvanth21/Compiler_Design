%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    void yyerror(const char *s);
    int yylex();
%}

%token ID
%token PLUS STAR LPAREN RPAREN
%%

line : E '\n' { printf("Valid Expression\n"); }
    ;

E : T EPrime
    ;

EPrime : PLUS T EPrime
    |
    ;

T : F TPrime
    ;

TPrime : STAR F TPrime
    |
    ;

F : LPAREN E RPAREN
    | ID
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr,"Error:%s\n",s);
}

int main() {
    printf("Enter an expression:");
    yyparse();
    return 0;
}
