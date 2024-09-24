type token =
  | EOF
  | DIMENSIONS
  | NOP
  | END
  | OF
  | ASSIGN
  | COMMA
  | LBRACKET
  | RBRACKET
  | DOT_DOT
  | DOT
  | SEP
  | ID of (string)
  | INT of (int)

open Parsing;;
let _ = parse_error;;
# 17 "parser.mly"

open Common
open Ast
open Printf
open Symbols

(** Raise a syntax error with the given message.
	@param msg	Message of the error. *)
let error msg =
	raise (SyntaxError msg)


(** Restructure the when assignment into selections.
	@param f	Function to build the assignment.
	@param ws	Sequence of (expression, conditions) terminated
				by (expression, NO_COND).
	@return		Built statement. *)
let rec make_when f ws =
	match ws with
	| [(e, NO_COND)]	->	f e
	| (e, c)::t			-> IF_THEN(c, f e, make_when f t)
	| _ -> failwith "whens list not ended by (expression, NO_COND)."

# 44 "parser.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* DIMENSIONS *);
  258 (* NOP *);
  259 (* END *);
  260 (* OF *);
  261 (* ASSIGN *);
  262 (* COMMA *);
  263 (* LBRACKET *);
  264 (* RBRACKET *);
  265 (* DOT_DOT *);
  266 (* DOT *);
  267 (* SEP *);
    0|]

let yytransl_block = [|
  268 (* ID *);
  269 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\005\000\003\000\003\000\
\006\000\006\000\007\000\008\000\008\000\008\000\000\000"

let yylen = "\002\000\
\007\000\003\000\001\000\001\000\003\000\005\000\000\000\003\000\
\003\000\003\000\005\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\015\000\000\000\000\000\000\000\000\000\
\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\000\000\001\000\000\000\000\000\006\000\000\000\014\000\
\013\000\012\000\010\000\008\000\009\000\000\000\011\000"

let yydgoto = "\002\000\
\004\000\009\000\020\000\010\000\011\000\021\000\022\000\035\000"

let yysindex = "\002\000\
\253\254\000\000\010\255\000\000\008\255\252\254\009\255\005\255\
\012\255\011\255\000\000\003\255\006\255\251\254\013\255\014\255\
\000\000\007\255\016\255\018\000\015\255\017\255\000\000\018\255\
\021\255\249\254\000\000\251\254\249\254\000\000\019\255\000\000\
\000\000\000\000\000\000\000\000\000\000\020\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\026\255\000\000\000\000\000\000\024\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\005\000\000\000\015\000\000\000\231\255\006\000"

let yytablesize = 35
let yytable = "\018\000\
\034\000\018\000\001\000\034\000\032\000\033\000\019\000\007\000\
\008\000\003\000\005\000\006\000\012\000\013\000\014\000\016\000\
\015\000\027\000\017\000\025\000\026\000\029\000\024\000\007\000\
\007\000\028\000\031\000\039\000\003\000\023\000\030\000\038\000\
\036\000\000\000\037\000"

let yycheck = "\007\001\
\026\000\007\001\001\000\029\000\012\001\013\001\012\001\012\001\
\013\001\013\001\001\001\004\001\004\001\009\001\003\001\013\001\
\006\001\000\000\013\001\013\001\005\001\005\001\009\001\000\000\
\012\001\011\001\006\001\008\001\003\001\015\000\013\001\013\001\
\028\000\255\255\029\000"

let yynames_const = "\
  EOF\000\
  DIMENSIONS\000\
  NOP\000\
  END\000\
  OF\000\
  ASSIGN\000\
  COMMA\000\
  LBRACKET\000\
  RBRACKET\000\
  DOT_DOT\000\
  DOT\000\
  SEP\000\
  "

let yynames_block = "\
  ID\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'config) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'opt_statements) in
    Obj.repr(
# 69 "parser.mly"
 (
		if _1 != 2 then error "only 2 dimension accepted";
		(_4, _6)
	)
# 147 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 77 "parser.mly"
  (
			if _1 >= _3 then error "illegal field values";
			[("", (0, (_1, _3)))]
		)
# 158 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 82 "parser.mly"
  ( set_fields _1 )
# 165 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 87 "parser.mly"
  ( [_1] )
# 172 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fields) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 89 "parser.mly"
  (_3 :: _1 )
# 180 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 94 "parser.mly"
  (
			if _3 >= _5 then error "illegal field values";
			(_1, (_3, _5))
		)
# 192 "parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
  ( NOP )
# 198 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'opt_statements) in
    Obj.repr(
# 104 "parser.mly"
  ( _1 _3 )
# 206 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cell) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 111 "parser.mly"
  (
			if (fst _1) != 0 then error "assigned x must be 0";
			if (snd _1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, _3)
		)
# 218 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 116 "parser.mly"
                       ( NOP )
# 226 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 124 "parser.mly"
  (
			if (_2 < -1) || (_2 > 1) then error "x out of range";
			if (_4 < -1) || (_4 > 1) then error "x out of range";
			(_2, _4)
		)
# 238 "parser.ml"
               : 'cell))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cell) in
    Obj.repr(
# 133 "parser.mly"
  ( CELL (0, fst _1, snd _1) )
# 245 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 135 "parser.mly"
  ( CST _1 )
# 252 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 137 "parser.mly"
  ( NONE )
# 259 "parser.ml"
               : 'expression))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.prog)
