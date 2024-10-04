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
  | OPARA
  | FPARA
  | DOT_DOT
  | DOT
  | PLUS
  | MINUS
  | MULT
  | DIV
  | MOD
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

# 50 "parser.ml"
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
  265 (* OPARA *);
  266 (* FPARA *);
  267 (* DOT_DOT *);
  268 (* DOT *);
  269 (* PLUS *);
  270 (* MINUS *);
  271 (* MULT *);
  272 (* DIV *);
  273 (* MOD *);
    0|]

let yytransl_block = [|
  274 (* ID *);
  275 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\005\000\003\000\003\000\
\006\000\006\000\007\000\008\000\008\000\008\000\009\000\009\000\
\009\000\009\000\010\000\010\000\010\000\010\000\010\000\000\000"

let yylen = "\002\000\
\007\000\003\000\001\000\001\000\003\000\005\000\000\000\002\000\
\003\000\003\000\005\000\003\000\003\000\001\000\003\000\003\000\
\003\000\001\000\001\000\002\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\024\000\000\000\000\000\000\000\000\000\
\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\000\000\001\000\008\000\000\000\006\000\000\000\000\000\
\000\000\022\000\021\000\019\000\000\000\000\000\018\000\000\000\
\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\
\011\000\023\000\000\000\000\000\015\000\016\000\017\000"

let yydgoto = "\002\000\
\004\000\009\000\020\000\010\000\011\000\021\000\036\000\037\000\
\038\000\039\000"

let yysindex = "\007\000\
\247\254\000\000\011\255\000\000\031\255\004\255\032\255\026\255\
\035\255\033\255\000\000\021\255\022\255\002\255\024\255\034\255\
\000\000\025\255\038\255\046\000\002\255\042\255\000\000\029\255\
\043\255\007\255\000\000\000\000\007\255\000\000\036\255\007\255\
\007\255\000\000\000\000\000\000\018\255\013\255\000\000\018\255\
\044\255\248\254\000\000\007\255\007\255\007\255\007\255\007\255\
\000\000\000\000\013\255\013\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\047\255\000\000\000\000\000\000\051\000\000\000\000\000\
\000\000\000\000\000\000\000\000\051\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\011\000\001\000\000\000\015\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\013\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\032\000\000\000\039\000\000\000\242\255\251\255\
\245\255\227\255"

let yytablesize = 289
let yytable = "\022\000\
\014\000\050\000\012\000\043\000\044\000\045\000\022\000\001\000\
\018\000\003\000\010\000\005\000\013\000\018\000\009\000\032\000\
\053\000\054\000\055\000\019\000\033\000\007\000\008\000\040\000\
\034\000\035\000\042\000\046\000\047\000\048\000\044\000\045\000\
\051\000\052\000\006\000\012\000\013\000\014\000\015\000\016\000\
\017\000\007\000\026\000\025\000\024\000\027\000\029\000\030\000\
\031\000\003\000\007\000\049\000\028\000\023\000\041\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\014\000\
\000\000\012\000\014\000\000\000\012\000\014\000\014\000\012\000\
\012\000\010\000\014\000\013\000\012\000\009\000\013\000\000\000\
\000\000\013\000\013\000\000\000\010\000\000\000\013\000\000\000\
\009\000"

let yycheck = "\014\000\
\000\000\010\001\000\000\033\000\013\001\014\001\021\000\001\000\
\007\001\019\001\000\000\001\001\000\000\007\001\000\000\009\001\
\046\000\047\000\048\000\018\001\014\001\018\001\019\001\029\000\
\018\001\019\001\032\000\015\001\016\001\017\001\013\001\014\001\
\044\000\045\000\004\001\004\001\011\001\003\001\006\001\019\001\
\019\001\018\001\005\001\019\001\011\001\000\000\005\001\019\001\
\006\001\003\001\000\000\008\001\021\000\015\000\019\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\007\001\
\255\255\007\001\010\001\255\255\010\001\013\001\014\001\013\001\
\014\001\007\001\018\001\007\001\018\001\007\001\010\001\255\255\
\255\255\013\001\014\001\255\255\018\001\255\255\018\001\255\255\
\018\001"

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
  OPARA\000\
  FPARA\000\
  DOT_DOT\000\
  DOT\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIV\000\
  MOD\000\
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
# 74 "parser.mly"
 (
		if _1 != 2 then error "only 2 dimension accepted";
		(_4, _6)
	)
# 239 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 82 "parser.mly"
  (
			if _1 >= _3 then error "illegal field values";
			[("", (0, (_1, _3)))]
		)
# 250 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 87 "parser.mly"
  ( set_fields _1 )
# 257 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 92 "parser.mly"
  ( [_1] )
# 264 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fields) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 94 "parser.mly"
  (_3 :: _1 )
# 272 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 99 "parser.mly"
  (
			if _3 >= _5 then error "illegal field values";
			(_1, (_3, _5))
		)
# 284 "parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
  ( NOP )
# 290 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'statement) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'opt_statements) in
    Obj.repr(
# 109 "parser.mly"
  ( SEQ(_1, _2) )
# 298 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cell) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 114 "parser.mly"
  (
			if (fst _1) != 0 then error "assigned x must be 0";
			if (snd _1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, _3)
		)
# 310 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 120 "parser.mly"
  ( NOP )
# 318 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 125 "parser.mly"
  (
			if (_2 < -1) || (_2 > 1) then error "x out of range";
			if (_4 < -1) || (_4 > 1) then error "x out of range";
			(_2, _4)
		)
# 330 "parser.ml"
               : 'cell))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 132 "parser.mly"
          ( NONE )
# 338 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 133 "parser.mly"
            ( NONE )
# 346 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 134 "parser.mly"
    ( NONE )
# 353 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 137 "parser.mly"
          ( NONE )
# 361 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 138 "parser.mly"
          ( NONE )
# 369 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 139 "parser.mly"
          ( NONE )
# 377 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 140 "parser.mly"
    ( NONE )
# 384 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cell) in
    Obj.repr(
# 143 "parser.mly"
      ( CELL(0, fst _1, snd _1) )
# 391 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 144 "parser.mly"
          ( NONE )
# 398 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 145 "parser.mly"
      ( CST _1 )
# 405 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 146 "parser.mly"
     ( NONE )
# 412 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'e) in
    Obj.repr(
# 147 "parser.mly"
                ( NONE )
# 419 "parser.ml"
               : 'f))
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
