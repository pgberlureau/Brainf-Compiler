open Preprocessing.Ast
open Pp
open Format

(*ID handler for while loops*)
let new_id =
        let counter = ref 0 in
        fun () -> let c = !counter in incr counter; string_of_int c

(*Compression of the initial expression*)
let rec compress = function
        | Move_ptr (i, Move_ptr(i',e)) -> compress (Move_ptr (i+i',e))
        | Move_ptr (i,e) -> Move_ptr (i, compress e)
        | Change_val (i,Change_val(i',e)) -> compress (Change_val (i+i',e))
        | Change_val (i,e) -> Change_val (i, compress e)
        | Print (i,e) -> Print (i, compress e)
        | Input (i,e) -> Input (i, compress e)
        | While (e1, e2) -> While (compress e1, compress e2)
        | Unit -> Unit

let adjust_size p =
        let a = Array.make 

(*Code compiling with rbx as the pointer*)
let rec compile_expr = function       
        | Move_ptr (i, e) -> "\taddq $"^string_of_int i^", %rbx\n"^compile_expr e

        | Change_val (i, e) -> "\taddb $"^string_of_int i^", (%rbx)\n"^compile_expr e

        | Print (i, e) -> if i=0 then compile_expr e else
                        "\tmovq $1, %rax\n\tmovq $1, %rdi\n\tmovq %rbx, %rsi\n\tmovq $1, %rdx\n\tsyscall\n"^compile_expr (Print(i-1,e))
       
        | Input (i, e) -> if i=0 then compile_expr e else
                        "\txorq %rax, %rax\n\txorq %rdi, %rdi\n\tmovq %rbx, %rsi\n\tmovq $1, %rdx\n\tsyscall\n"^compile_expr (Input(i-1,e))

        | While (e1, e2) -> let c = new_id () in 
                        "while_"^c^":\n\tcmpb $0, (%rbx)\n\tje end_while_"^c^"\n"^compile_expr e1^"\tjmp while_"^c^"\nend_while_"^c^":\n"^compile_expr e2
        | Unit -> ""
        
(*Produce the output file*)
let compile_program p name =
        let compressed = compress p in
        let init_pos = 15000 in
        let size = 30000 in
        let code = compile_expr compressed in
        let prelude = "\t.text\n\t.globl main\nmain:\n\tmovq %rsp, %rbp\n\tmovq $tab, %rbx\n\taddq $"^(string_of_int init_pos)^", %rbx\n" in
        let postlude = "\tmovq %rbp, %rsp\n\txorq %rax, %rax\n\tret\n\t.data\ntab: .space "^(string_of_int size)^", 0" in
        let p = prelude^code^postlude in
        let f = open_out name in
        Printf.fprintf f "%s\n" p;
        close_out f
