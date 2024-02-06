type expr =
        | Move_ptr of int*expr
        | Change_val of int*expr
        | Print of int*expr
        | Input of int*expr
        | While of expr*expr
        | Unit
