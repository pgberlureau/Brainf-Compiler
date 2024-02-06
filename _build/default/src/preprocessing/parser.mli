
(* The type of tokens. *)

type token = 
  | R_BRACKET
  | PRINT
  | L_BRACKET
  | INPUT
  | INCR_VAL
  | INCR_PTR
  | EOF
  | DECR_VAL
  | DECR_PTR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val expression: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
