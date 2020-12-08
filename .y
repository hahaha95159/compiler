%{
#include <stdio.h>
void yyerror(const char* msg) {}
%}

%left '+' '-'
%left '*' '/' '%'
%right UMINUS
%token Identifier 
%token empty
%token Integer
%token int if while exit read write 
%%
program:Identifier'('')' function_body {printf("Identifier() function body");}
	;
function_body:'{'variable_declarations statements'}' {printf("variable_declarations statements");}
	;
variable_declarations:empty {printf("empty");}
	|variable_declarations variable_declaration {printf("variable_declarations statements");}
	;
variable_declaration: int Identifier';' {printf("int Identifier;");}
	;
statements:empty {printf("empty");}
	|statements statement {printf("statements statement");}
	;
statement:assignment_statement {printf("assignment_statement\n");}
	|compound_statement {printf("compound_statement\n");}
	|if_statement {printf("if_statement\n");}
	|while_statement {printf("while_statement\n");}
	|exit_statement {printf("exit_statement\n");}
	|read_statement {printf("read_statement\n");}
