%{
#include<stdio.h>
int c = 0;
%}
%%
[//].*[^\n]				{c++;}
"/*"[a-zA-Z0-9' '\t\n]+"*/"	{c++;}
[a-zA-Z0-9]				{fprintf(yyout,"%s",yytext);}
%%
int main(int argc, char **argv)
{
	FILE *f1,*f2;
	if(argc > 1)		//Pass 2 files for execution
	{
		f1 = fopen(argv[1],"r");	//Open first file
		if(!f1)						//Not able to open file
		{
			printf("File error\n");
			exit(1);
		}
		yyin = f1;
		f2 = fopen(argv[2],"w");	//Open second file
		if(!f2)
		{
			printf("Error\n");
			exit(1);
		}
		yyout = f2;
		yylex();
		printf("Number of comment lines :%d\n",c);
	}
	return 0;
}
