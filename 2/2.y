%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
input:	s'\n'	{printf("Successful Grammer\n");exit(0);}
	s: 	A s1 B | B
	s1:  A s1 | ;
%%
main()
{
	printf("Enter a String\n");
	yyparse();
}

int yyerror()
{
	printf("ERROR\n");
	exit(0);
}
