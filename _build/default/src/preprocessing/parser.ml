
module MenhirBasics = struct
  
  exception Error
  
  let _eRR : exn =
    Error
  
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
  
end

include MenhirBasics

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState38
  | MenhirState35
  | MenhirState27
  | MenhirState25
  | MenhirState22
  | MenhirState20
  | MenhirState18
  | MenhirState17
  | MenhirState16
  | MenhirState15
  | MenhirState14
  | MenhirState13
  | MenhirState12
  | MenhirState10
  | MenhirState3
  | MenhirState2
  | MenhirState0

# 1 "src/preprocessing/parser.mly"
  
        open Ast

# 61 "src/preprocessing/parser.ml"

let rec _menhir_reduce15 : _menhir_env -> ((('ttv_tail * _menhir_state) * _menhir_state * (Ast.expr))) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 30 "src/preprocessing/parser.mly"
                                                              (While (e1,e2))
# 69 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce11 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 24 "src/preprocessing/parser.mly"
                                (Print(List.length l,  e))
# 79 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce13 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 27 "src/preprocessing/parser.mly"
                                (Input(List.length l,  e))
# 89 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce7 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 18 "src/preprocessing/parser.mly"
                                   (Change_val (List.length l, e))
# 99 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce3 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 12 "src/preprocessing/parser.mly"
                                   (Move_ptr (List.length l, e))
# 109 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce9 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 21 "src/preprocessing/parser.mly"
                                   (Change_val (-List.length l, e))
# 119 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce5 : _menhir_env -> ('ttv_tail * _menhir_state * (unit list)) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (l : (unit list))), _, (e : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 15 "src/preprocessing/parser.mly"
                                   (Move_ptr (-List.length l, e))
# 129 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce7 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce11 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DECR_PTR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | DECR_VAL ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | EOF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INCR_PTR ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INCR_VAL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INPUT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | L_BRACKET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | PRINT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | R_BRACKET ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))) = _menhir_stack in
                let _v : (Ast.expr) = 
# 31 "src/preprocessing/parser.mly"
                                              (e1)
# 192 "src/preprocessing/parser.ml"
                 in
                _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DECR_PTR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | DECR_VAL ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | EOF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | INCR_PTR ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | INCR_VAL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | INPUT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | L_BRACKET ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | PRINT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce7 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce11 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
        Obj.magic _1
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_print_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 280 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_print_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 | MenhirState35 | MenhirState17 | MenhirState16 | MenhirState15 | MenhirState14 | MenhirState13 | MenhirState12 | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 25 "src/preprocessing/parser.mly"
                   (Print(List.length l,  Unit))
# 310 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState0 | MenhirState45 | MenhirState44 | MenhirState43 | MenhirState42 | MenhirState41 | MenhirState40 | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | _ ->
        _menhir_fail ()

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECR_PTR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | DECR_VAL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EOF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | INCR_PTR ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | INCR_VAL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | INPUT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | L_BRACKET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | PRINT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_nonempty_list_input_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 | MenhirState35 | MenhirState3 | MenhirState17 | MenhirState16 | MenhirState15 | MenhirState14 | MenhirState13 | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 28 "src/preprocessing/parser.mly"
                   (Input(List.length l,  Unit))
# 404 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 414 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_input_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState38 | MenhirState45 | MenhirState44 | MenhirState43 | MenhirState42 | MenhirState41 | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_incr_val_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 | MenhirState35 | MenhirState3 | MenhirState12 | MenhirState17 | MenhirState16 | MenhirState15 | MenhirState14 | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 19 "src/preprocessing/parser.mly"
                      (Change_val (List.length l, Unit))
# 476 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 486 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_incr_val_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState38 | MenhirState40 | MenhirState45 | MenhirState44 | MenhirState43 | MenhirState42 | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_incr_ptr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 | MenhirState35 | MenhirState3 | MenhirState12 | MenhirState13 | MenhirState17 | MenhirState16 | MenhirState15 | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 13 "src/preprocessing/parser.mly"
                      (Move_ptr (List.length l, Unit))
# 548 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 558 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_incr_ptr_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState38 | MenhirState40 | MenhirState41 | MenhirState45 | MenhirState44 | MenhirState43 | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
    | _ ->
        _menhir_fail ()

and _menhir_reduce17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.expr) = 
# 33 "src/preprocessing/parser.mly"
              ( Unit )
# 594 "src/preprocessing/parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_nonempty_list_decr_val_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 | MenhirState35 | MenhirState3 | MenhirState12 | MenhirState13 | MenhirState14 | MenhirState17 | MenhirState16 | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 22 "src/preprocessing/parser.mly"
                      (Change_val (-List.length l, Unit))
# 629 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 639 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_decr_val_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState38 | MenhirState40 | MenhirState41 | MenhirState42 | MenhirState45 | MenhirState44 | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_decr_ptr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 | MenhirState35 | MenhirState3 | MenhirState12 | MenhirState13 | MenhirState14 | MenhirState15 | MenhirState17 | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | EOF ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | L_BRACKET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | R_BRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (l : (unit list))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 16 "src/preprocessing/parser.mly"
                      (Move_ptr (-List.length l, Unit))
# 701 "src/preprocessing/parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (unit))), _, (xs : (unit list))) = _menhir_stack in
        let _v : (unit list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 711 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_decr_ptr_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState38 | MenhirState40 | MenhirState41 | MenhirState42 | MenhirState43 | MenhirState45 | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DECR_PTR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | DECR_VAL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | EOF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | INCR_PTR ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | INCR_VAL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | INPUT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | L_BRACKET ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRINT ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 44 "src/preprocessing/parser.mly"
                (())
# 844 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PRINT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | DECR_PTR | DECR_VAL | EOF | INCR_PTR | INCR_VAL | INPUT | L_BRACKET | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 859 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_print_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECR_PTR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | DECR_VAL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | EOF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | INCR_PTR ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | INCR_VAL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | INPUT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | L_BRACKET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | PRINT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 46 "src/preprocessing/parser.mly"
                (())
# 897 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INPUT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DECR_PTR | DECR_VAL | EOF | INCR_PTR | INCR_VAL | L_BRACKET | PRINT | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 912 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_input_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 40 "src/preprocessing/parser.mly"
                   (())
# 923 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INCR_VAL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | DECR_PTR | DECR_VAL | EOF | INCR_PTR | INPUT | L_BRACKET | PRINT | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 938 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_incr_val_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 36 "src/preprocessing/parser.mly"
                   (())
# 949 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INCR_PTR ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | DECR_PTR | DECR_VAL | EOF | INCR_VAL | INPUT | L_BRACKET | PRINT | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 964 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_incr_ptr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 42 "src/preprocessing/parser.mly"
                   (())
# 979 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECR_VAL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | DECR_PTR | EOF | INCR_PTR | INCR_VAL | INPUT | L_BRACKET | PRINT | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 994 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_decr_val_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (unit) = 
# 38 "src/preprocessing/parser.mly"
                   (())
# 1005 "src/preprocessing/parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECR_PTR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | DECR_VAL | EOF | INCR_PTR | INCR_VAL | INPUT | L_BRACKET | PRINT | R_BRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (unit))) = _menhir_stack in
        let _v : (unit list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 1020 "src/preprocessing/parser.ml"
         in
        _menhir_goto_nonempty_list_decr_ptr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and expression : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECR_PTR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DECR_VAL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INCR_PTR ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INCR_VAL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INPUT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | L_BRACKET ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 1072 "src/preprocessing/parser.ml"
