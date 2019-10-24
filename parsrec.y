%{
#include<stdio.h>
#include<stdlib.h>
%}

%token ID NUM SWITCH CASE DEFAULT BREAK LE GE EQ NE AND OR IF THEN WHILE FOR ELSE
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'

%%

S    :    ST{printf("\nInput accepted.\n");exit(0);};
      ;
ST  :    SWITCH'('ID')''{'B'}'
      ;
B    :    C
      |    C D
      | D
      ;
C  :    C C
    |    CASE NUM':'ST1 BREAK';'
    ;
D  :    DEFAULT':'ST1 BREAK';'
    |    DEFAULT':'ST1
    ;
ST1    :    WHILE'('E2')' E';'
    |   FOR'('E';'E2';'E')'E';'
    |   ST2
    |    ST1 ST1
    |    E';'
    ;
ST2 :    IF'('E2')'THEN E';'
    |    IF'('E2')'THEN E';'ELSE E';'  
    |    IF'('E2')'THEN ST2
    |    IF'('E2')'THEN ST2 ELSE ST2
    |   IF'('E2')'THEN ST2 ELSE E';'
    |   IF'('E2')'THEN E';' ELSE ST2 
    ;
E2    :    E'<'E
    |    E'>'E
    |    E LE E
    |    E GE E
    |    E EQ E
    |    E NE E
    |    E AND E
    |    E OR E
    ;
E    :    ID'='E
    |    E'+'E
    |    E'-'E
    |    E'*'E
    |    E'/'E
    |    E'<'E
    |    E'>'E
    |    E LE E
    |    E GE E
    |    E EQ E
    |    E NE E
    |    E AND E
    |    E OR E
    |    ID
    |    NUM
    ;

%%

#include"lex.yy.c"

main()
{
    printf("\nEnter the expression: ");
    yyparse();
}   