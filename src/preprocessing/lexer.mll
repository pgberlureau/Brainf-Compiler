{
        open Parser
        open Lexing
}

rule token = parse
        | '\n' {new_line lexbuf; token lexbuf}
        | '>' { INCR_PTR }
        | '<' { DECR_PTR }
        | '+' { INCR_VAL }
        | '-' { DECR_VAL }
        | '.' { PRINT }
        | ',' { INPUT }
        | '[' { L_BRACKET }
        | ']' { R_BRACKET }
        | eof { EOF }
        | _ { token lexbuf }
