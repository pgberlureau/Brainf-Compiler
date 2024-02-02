open Preprocessing.Ast

let rec print_expr = function
        | Incr_ptr (i,e) -> for j=1 to i do print_string ">" done; print_expr e
        | Decr_ptr (i,e) -> for j=1 to i do print_string "<" done; print_expr e
        | Incr_val (i,e) -> for j=1 to i do print_string "+" done; print_expr e
        | Decr_val (i,e) -> for j=1 to i do print_string "-" done; print_expr e
        | Print (i,e) -> for j=1 to i do print_string "." done; print_expr e
        | Input (i,e) -> for j=1 to i do print_string "," done; print_expr e
        | While (e1,e2) -> print_char '['; print_expr e1; print_char ']'; print_expr e2
        | Unit -> ()
