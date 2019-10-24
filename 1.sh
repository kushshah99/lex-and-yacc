lex palindrome.l
yacc -d palindrome.y
 gcc lex.yy.c y.tab.c -ll