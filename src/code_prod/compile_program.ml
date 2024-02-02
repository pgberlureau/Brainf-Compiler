open Preprocessing.Ast
open Format

let counter = ref 0
let byte = 8
let stack_size = 30000

(*arithmetic opérations are done in rbx and rcx registers*)
(*ptr is rsp*)
let rec compile_expr = function        
        | Incr_ptr (i, e) -> "\tsubq $"^(string_of_int (i*byte))^", %rsp\n"^compile_expr e

        | Decr_ptr (i, e) -> "\taddq $"^(string_of_int (i*byte))^", %rsp\n"^compile_expr e

        | Incr_val (i, e) -> "\taddq $"^(string_of_int i)^", (%rsp)\n"^compile_expr e

        | Decr_val (i, e) -> "\tsubq $"^(string_of_int i)^", (%rsp)\n"^compile_expr e

        | Print (i, e) -> if i=0 then compile_expr e else
                        "\tmovq $1, %rax\n\tmovq $1, %rdi\n\tmovq %rsp, %rsi\n\tmovq $1, %rdx\n\tsyscall\n"^compile_expr (Print (i-1, e))
       
        | Input (i, e) -> if i=0 then compile_expr e else 
                        "\txorq %rax, %rax\n\txorq %rdi, %rdi\n\tmovq %rsp, %rsi\n\tmovq $1, %rdx\n\tsyscall\n"^compile_expr (Input(i-1,e))

        | While (e1, e2) -> let c = !counter in 
                                let string_c = string_of_int c in
                                incr counter;
                                "while_"^string_c^":\n\txorq %rbx, %rbx\n\tcmpb %bl, (%rsp)\n\tje end_while_"^string_c^"\n"^compile_expr e1^"\tjmp while_"^string_c^"\nend_while_"^string_c^":\n"^compile_expr e2
        | Unit -> ""

let compile_program p name =
        let code = compile_expr p in
        let prelude = "\t.text\n\t.globl main\nmain:\n\tmovq %rsp, %rbp\n" in
        let init_stack = "\txorq %rcx, %rcx\n\tmovq $"^(string_of_int stack_size)^", %rbx\ninit_stack:\n\tcmpq %rbx, %rcx\n\tje end_init_stack\n\tpushq %rcx\n\tdecq %rbx\n\tjmp init_stack\nend_init_stack:\n\tmovq %rbp, %rsp\n\tsubq $8, %rsp\n" in
        let postlude = "\tmovq %rbp, %rsp\n\tmovq $0, %rax\n\tret\n\t.data" in
        let p = prelude^init_stack^code^postlude in
        let f = open_out name in
        Printf.fprintf f "%s\n" p;
        close_out f
