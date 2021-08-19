package Analizador;
import java_cup.runtime.Symbol;
%%
%class Lexer
%type java_cup.runtime.Symbol
%cup
%unicode
%line
%column
%char
%public
D= [0-9]+
ID = [a-zA-Z$_][a-zA-Z0-9$_]*
espacio=[\t|\r|\n]+
esp = [" "]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn, yytext());
    }
%}
%%
<YYINITIAL> {
    "+"                       { return symbol(sym.SUMA);}
    "*"                       { return symbol(sym.POR);}
    "-"                       { return symbol(sym.RESTA);}
    "/"                       { return symbol(sym.ENTRE);}
    ";"                       { return symbol(sym.PUNTOC);}
    "*"                       { return symbol(sym.POR);}
    "("                       { return symbol(sym.PAR_A);}
    ")"                       { return symbol(sym.PAR_C);}
    "="                       { return symbol(sym.IGUAL);}
    {D}                       { return symbol(sym.NUMERO);}
    {ID}                      { return symbol(sym.ID); }
}
{esp} {/*ignore*/}
{espacio}           {/*Ignore*/}
[^]                           { return symbol(sym.ERRORLEX); }