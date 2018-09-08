grammar MP;

@lexer::header {
from lexererr import *
}

options{
	language=Python3;
}

program  : (vardecl|funcdec)+;
expr:
	  LP expr RP
	| expr (MUL|DIV) expr
	| expr SUB expr
	| <assoc=right>expr ADD expr 
	| INTLIT|REALLIT
	| ID
	| call
	; 
listid: ID (CM ID)*;
listexpr:expr CM listexpr|expr;
//Variable declaration
typesyntaxtodec:arraydec|BOOLEAN|INTEGER|REAL|STRING;
arraydec:ARRAY LSP INTLIT DOUBLEDOT INTLIT RSP OF (BOOLEAN|INTEGER|REAL|STRING);
vardecl: VAR (listid CL typesyntaxtodec SM)+;
//statements:
assignment: ID EQ expr;
call: ID LP listexpr? RP;
myreturn: MYRETURN expr;

funcdec: mytype ID LP pardec RP LB body RB;
pardec: INTEGER listid |REAL listid |INTEGER listid SM REAL listid ;

body: (((assignment|call|myreturn) SM)|vardecl)*;
//type
mytype: INTEGER|REAL;
INTEGER: I N T E G E R ;
REAL:R E A L;
BOOLEAN: B O O L E A N;
STRING: S T R I N G;
ARRAY: A R R A Y;
MYRETURN:'return';//phai truoc ID
VOID: 'void'  ;

fragment Letter: [a-zA-Z_];
fragment Digit: [0-9];
//Separators
LSP:'[';
RSP:']';
CL:':';
LP: '(' ;
DOUBLEDOT:'..';
RP: ')' ;
LB: '{';
RB: '}';
SM: ';' ;
CM:',';
//operators
NOT: N O T;
OR: O R;
NE: '<>';
LT:'<';
LTE:'<=';
INTEGERDIV: D I V;
MOD: M O D;
AND: A N D;
GT:'>';
GTE:'>=';
EQ:'=';
ADD:'+';
SUB:'-';
MUL:'*';
DIV:'/';
//literals
fragment Exponent: [eE]'-'?Digit+ ;
REALLIT: ('.'Digit+|Digit+'.'|Digit+'.'Digit+)Exponent?
		| Digit+Exponent;
INTLIT: [0-9]+;
BOOLLIT: (T R U E|F A L S E);
STRINGLIT: '"'([0-9a-zA-Z _]|Escapesequence)*'"';
//comment
fragment CMSYMBOL:'(*'|'{'|'//';
// \r\n\t thi s
COMMENT1:'//'([0-9a-z A-Z_\t]|CMSYMBOL|'}'|'*)')*;
COMMENT2:'(*'([0-9a-z A-Z_\t\r\n]|CMSYMBOL|'}')*'*)';
COMMENT3:'{'([0-9a-z A-Z_\t\r\n]|CMSYMBOL|'*)')*'}';
comment:COMMENT1 
		| COMMENT2
		| COMMENT3
		;
//luan ly
BREAK:B R E A K;
CONTINUE:C O N T I N U E;
FOR:F O R;
TO:T O;
DOWNTO:D O W N T O;
DO:D O;
IF:I F;
THEN:T H E N;
ELSE:E L S E;
WHILE:W H I L E;
BEGIN:B E G I N;
END:E N D;
FUNCTION:F U N C T I O N;
PROCEDURE:P R O C E D U R E;
VAR:V A R;
OF:O F;
keyword:BREAK|CONTINUE|FOR|TO|DOWNTO|DO|IF|THEN|ELSE|MYRETURN
		|WHILE|BEGIN|END|FUNCTION|PROCEDURE|VAR|BOOLLIT
		|ARRAY|OF|REAL|BOOLEAN|INTEGER|STRING|NOT|AND|OR|DIV|MOD;
ID: Letter(Letter|Digit)*;//dat ID o cuoi de tru keyword ra
fragment Escapesequence: ('\\\''|'\\"'|'\\\\'|'\\b'|'\\f'|'\\r'|'\\n'|'\\t'); 
// ly do la ',\ duoc dung nhu 1 cu phap nen muon no thanh ki tu f dung \
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
ERROR_CHAR: .;
UNCLOSE_STRING: .;
ILLEGAL_ESCAPE: .;
// replace (?i)
fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];