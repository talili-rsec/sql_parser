%{
%}

%union {
  int num;
  char sym;
}

%token EOL
%token<num> NUMBER
%type<num> exp
%token PLUS MINUS MULTIPLY LPAREN RPAREN SELECT
%left PLUS MINUS
%left MULTIPLY
%left NEG     /* negation--unary minus */
%right POW    /* exponentiation        */

%%

input:
| SELECT line input
;

line:
  exp EOL {printf("%d\n", $1);}
| EOL;

exp:
  NUMBER {$$ = $1;}
| exp PLUS exp {$$ = $1 + $3;}
| exp MINUS exp {$$ = $1 - $3;}
| exp MULTIPLY exp {$$ = $1 * $3;}
| PLUS NUMBER { $$ = $2; }
| MINUS exp  %prec NEG { $$ = -$2; }
| exp POW exp { $$ = pow ($1, $3); }
| LPAREN exp RPAREN { $$ = $2; }
;

%%

int main() {
  yyparse();

  return 0;
}

yyerror(char* s) {
  printf("ERR: %s\n", s);

  return 0;
}
