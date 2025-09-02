%{
  #include "parser.tab.h"
%}

%%

[0-9]+ {yylval.num = atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"(" {return LPAREN;}
")" {return RPAREN;}
"^" {return POW;}
(?i:select) {return SELECT;}
\n {return EOL;}
. {}

%%

yywrap() {}
