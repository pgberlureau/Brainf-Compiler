open Preprocessing.Ast

let rec print_expr = function
        | Move_ptr (i,e) when i>0-> for j=1 to i do print_string ">" done; print_expr e
        | Move_ptr (i,e) -> for j=1 to (-i) do print_string "<" done; print_expr e
        | Change_val (i,e) when i>0 -> for j=1 to i do print_string "+" done; print_expr e
        | Change_val (i,e) -> for j=1 to (-i) do print_string "-" done; print_expr e
        | Print (i,e) -> for j=1 to i do print_string "." done; print_expr e
        | Input (i,e) -> for j=1 to i do print_string "," done; print_expr e
        | While (e1,e2) -> print_char '['; print_expr e1; print_char ']'; print_expr e2
        | Unit -> ()
