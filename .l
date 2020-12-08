%option yylineno
%{
#include <stdio.h>
#include "lotus.tab.h"
FILE *fp;
FILE *file;
char ch;
%}
ws [ \t\n]
L [b-df-hj-np-tv-z]
comment "//"+[A-Za-z0-9]*
operator \+|-|\*|\/|\%|\==|>|<|!=|>=|<=|&&|\|\||\!|\=|\;|\,|\(|\)|\{|\}
keyword else|exit|int|read|while|write|if
IntegerConstant [0-9]*
identifier [A-Za-z]+[A-Za-z0-9]*
%%

{ws} {}
{comment} {}
{operator} {printf("Operator: %s\n",yytext);if(file!=0){fprintf(file,"Operator: %s\n",yytext);}}
{keyword} {printf("Keyword: %s\n",yytext);if(file!=0){fprintf(file,"Keyword: %s\n",yytext);}}
{IntegerConstant} {printf("Integer Constant: %d\n",atoi(yytext));if(file!=0){fprintf(file,"Integer  Constant: %d\n",atoi(yytext));}}
{identifier} {printf("Identifier: %s\n",yytext);if(file!=0){fprintf(file,"Identifier: %s\n",yytext);}}
. {printf("Lexical error:line %d: unknown character %s\n",yylineno,yytext);if(file!=0){fprintf(yyout,"Lexical error:line %d: unknown character %s\n",yylineno,yytext);}}
%%
int main(int argc, char* argv[])
{
	if(argc==3){
