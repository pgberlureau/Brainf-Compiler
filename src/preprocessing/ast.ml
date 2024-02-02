type expr =
        | Incr_ptr of int*expr
        | Decr_ptr of int*expr
        | Incr_val of int*expr
        | Decr_val of int*expr
        | Print of int*expr
        | Input of int*expr
        | While of expr*expr
        | Unit

