%{
        open Ast
%}

%token INCR_PTR DECR_PTR INCR_VAL DECR_VAL PRINT INPUT L_BRACKET R_BRACKET EOF

%start <expr> expression

%%

expression:
        | l=incr_ptr+ e=expression {Incr_ptr (List.length l, e)} 
        | l=incr_ptr+ {Incr_ptr (List.length l, Unit)}

        | l=decr_ptr+ e=expression {Decr_ptr (List.length l, e)}
        | l=decr_ptr+ {Decr_ptr (List.length l, Unit)}

        | l=incr_val+ e=expression {Incr_val (List.length l, e)}
        | l=incr_val+ {Incr_val (List.length l, Unit)}

        | l=decr_val+ e=expression {Decr_val (List.length l, e)}
        | l=decr_val+ {Decr_val (List.length l, Unit)}

        | l=print+ e=expression {Print(List.length l,  e)}
        | l=print+ {Print(List.length l,  Unit)}

        | l=input+ e=expression {Input(List.length l,  e)}
        | l=input+ {Input(List.length l,  Unit)}

        | L_BRACKET e1 = expression R_BRACKET e2 = expression {While (e1,e2)} 
        | L_BRACKET e1 = expression R_BRACKET {e1} 
        | EOF { Unit }

incr_ptr:
        | INCR_PTR {()}
decr_ptr:
        | DECR_PTR {()}
incr_val:
        | INCR_VAL {()}
decr_val:
        | DECR_VAL {()}
print:
        | PRINT {()}
input:
        | INPUT {()}

