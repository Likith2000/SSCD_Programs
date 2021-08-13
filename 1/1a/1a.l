%{
#include<stdio.h>
int bo=0,bc=0,op=0,id=0,flag=0,top=-1;
%}

%%
-?[0-9]+		{id++;printf("\nIdentifier:");ECHO;}
[\+\-\*\/\=]    {op++;printf("\nOperator:");ECHO;}
"("				{if(bc<=bo)bo++;}
")"				{bc++;}
";"				{flag=1;}
.|\n			{return 0;}
%%

int main()
{
	printf("Enter the expression:\n");
	yylex();
	if((op+1)==id && flag==0 && top==-1 && bc==bo)
	{
		printf("\nIdentifiers are %d\nOperators are %d\n",id,op);
		printf("\nExpression is valid\n");
	}
	else
		printf("\nExpression is invalid");
	return 1;
}
int yywrap()
{
	return 1;
}
