type token =
  | EOF
  | DIMENSIONS
  | NOP
  | IF
  | ELSE
  | ELSIF
  | THEN
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
  | EQ
  | NE
  | LT
  | GT
  | LE
  | GE
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

# 60 "parser.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* DIMENSIONS *);
  258 (* NOP *);
  259 (* IF *);
  260 (* ELSE *);
  261 (* ELSIF *);
  262 (* THEN *);
  263 (* END *);
  264 (* OF *);
  265 (* ASSIGN *);
  266 (* COMMA *);
  267 (* LBRACKET *);
  268 (* RBRACKET *);
  269 (* OPARA *);
  270 (* FPARA *);
  271 (* DOT_DOT *);
  272 (* DOT *);
  273 (* PLUS *);
  274 (* MINUS *);
  275 (* MULT *);
  276 (* DIV *);
  277 (* MOD *);
  278 (* EQ *);
  279 (* NE *);
  280 (* LT *);
  281 (* GT *);
  282 (* LE *);
  283 (* GE *);
    0|]

let yytransl_block = [|
  284 (* ID *);
  285 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\005\000\003\000\003\000\
\006\000\006\000\006\000\010\000\010\000\010\000\009\000\009\000\
\009\000\009\000\009\000\009\000\007\000\008\000\008\000\008\000\
\011\000\011\000\011\000\011\000\012\000\012\000\012\000\012\000\
\012\000\000\000"

let yylen = "\002\000\
\007\000\003\000\001\000\001\000\003\000\005\000\000\000\002\000\
\003\000\003\000\005\000\005\000\003\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\005\000\003\000\003\000\001\000\
\003\000\003\000\003\000\001\000\001\000\002\000\001\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\034\000\000\000\000\000\000\000\000\000\
\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\000\000\032\000\031\000\029\000\000\000\000\000\
\000\000\028\000\000\000\000\000\001\000\008\000\000\000\006\000\
\000\000\030\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\033\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\025\000\026\000\027\000\000\000\000\000\
\000\000\014\000\011\000\021\000\000\000\000\000\013\000\000\000\
\000\000\012\000"

let yydgoto = "\002\000\
\004\000\009\000\021\000\010\000\011\000\022\000\030\000\031\000\
\032\000\075\000\033\000\034\000"

let yysindex = "\008\000\
\238\254\000\000\019\255\000\000\016\255\242\254\018\255\017\255\
\030\255\038\255\000\000\023\255\032\255\253\254\035\255\044\255\
\000\000\250\254\037\255\058\255\075\000\253\254\067\255\000\000\
\048\255\250\254\250\254\000\000\000\000\000\000\047\255\072\255\
\036\255\000\000\069\255\250\254\000\000\000\000\250\254\000\000\
\255\254\000\000\250\254\250\254\250\254\250\254\250\254\250\254\
\250\254\250\254\253\254\250\254\250\254\250\254\052\255\001\255\
\001\255\000\000\036\255\036\255\001\255\001\255\001\255\001\255\
\001\255\001\255\031\255\000\000\000\000\000\000\070\255\253\254\
\250\254\000\000\000\000\000\000\076\255\078\255\000\000\253\254\
\031\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\079\255\000\000\000\000\000\000\085\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\042\255\000\000\000\000\000\000\000\000\058\000\
\080\000\000\000\027\000\053\000\081\255\082\255\083\255\084\255\
\085\255\086\255\000\000\000\000\000\000\000\000\000\000\087\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\042\255\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\238\255\000\000\078\000\000\000\244\255\251\255\
\022\000\015\000\007\000\232\255"

let yytablesize = 364
let yytable = "\018\000\
\024\000\023\000\042\000\038\000\019\000\007\000\026\000\019\000\
\001\000\023\000\003\000\027\000\058\000\007\000\008\000\043\000\
\044\000\043\000\044\000\005\000\041\000\028\000\029\000\006\000\
\020\000\012\000\022\000\068\000\069\000\070\000\056\000\013\000\
\067\000\057\000\072\000\073\000\014\000\074\000\023\000\061\000\
\062\000\063\000\064\000\065\000\066\000\007\000\007\000\015\000\
\007\000\059\000\060\000\016\000\023\000\077\000\052\000\053\000\
\054\000\010\000\025\000\023\000\017\000\081\000\007\000\043\000\
\044\000\035\000\036\000\023\000\045\000\046\000\047\000\048\000\
\049\000\050\000\037\000\039\000\040\000\051\000\055\000\009\000\
\071\000\076\000\079\000\080\000\007\000\003\000\015\000\016\000\
\017\000\018\000\019\000\020\000\024\000\007\000\078\000\082\000\
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
\000\000\000\000\000\000\024\000\024\000\024\000\024\000\024\000\
\000\000\007\000\007\000\024\000\007\000\000\000\024\000\000\000\
\000\000\024\000\024\000\000\000\000\000\000\000\024\000\024\000\
\024\000\024\000\024\000\024\000\024\000\022\000\022\000\022\000\
\022\000\022\000\000\000\000\000\000\000\022\000\000\000\000\000\
\022\000\000\000\000\000\022\000\022\000\000\000\000\000\000\000\
\022\000\022\000\022\000\022\000\022\000\022\000\022\000\023\000\
\023\000\023\000\023\000\023\000\010\000\010\000\010\000\023\000\
\010\000\000\000\023\000\000\000\010\000\023\000\023\000\000\000\
\000\000\000\000\023\000\023\000\023\000\023\000\023\000\023\000\
\023\000\000\000\009\000\009\000\009\000\010\000\009\000\000\000\
\000\000\000\000\009\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000"

let yycheck = "\003\001\
\000\000\014\000\027\000\022\000\011\001\000\000\013\001\011\001\
\001\000\022\000\029\001\018\001\014\001\028\001\029\001\017\001\
\018\001\017\001\018\001\001\001\026\000\028\001\029\001\008\001\
\028\001\008\001\000\000\052\000\053\000\054\000\036\000\015\001\
\051\000\039\000\004\001\005\001\007\001\007\001\051\000\045\000\
\046\000\047\000\048\000\049\000\050\000\004\001\005\001\010\001\
\007\001\043\000\044\000\029\001\000\000\072\000\019\001\020\001\
\021\001\000\000\015\001\072\000\029\001\080\000\028\001\017\001\
\018\001\029\001\009\001\080\000\022\001\023\001\024\001\025\001\
\026\001\027\001\000\000\009\001\029\001\006\001\010\001\000\000\
\029\001\012\001\007\001\006\001\000\000\007\001\006\001\006\001\
\006\001\006\001\006\001\006\001\015\000\007\001\073\000\081\000\
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
\255\255\255\255\255\255\003\001\004\001\005\001\006\001\007\001\
\255\255\004\001\005\001\011\001\007\001\255\255\014\001\255\255\
\255\255\017\001\018\001\255\255\255\255\255\255\022\001\023\001\
\024\001\025\001\026\001\027\001\028\001\003\001\004\001\005\001\
\006\001\007\001\255\255\255\255\255\255\011\001\255\255\255\255\
\014\001\255\255\255\255\017\001\018\001\255\255\255\255\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\003\001\
\004\001\005\001\006\001\007\001\003\001\004\001\005\001\011\001\
\007\001\255\255\014\001\255\255\011\001\017\001\018\001\255\255\
\255\255\255\255\022\001\023\001\024\001\025\001\026\001\027\001\
\028\001\255\255\003\001\004\001\005\001\028\001\007\001\255\255\
\255\255\255\255\011\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\028\001"

let yynames_const = "\
  EOF\000\
  DIMENSIONS\000\
  NOP\000\
  IF\000\
  ELSE\000\
  ELSIF\000\
  THEN\000\
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
  EQ\000\
  NE\000\
  LT\000\
  GT\000\
  LE\000\
  GE\000\
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
# 80 "parser.mly"
 (
		if _1 != 2 then error "only 2 dimension accepted";
		(_4, _6)
	)
# 303 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 87 "parser.mly"
  (
			if _1 >= _3 then error "illegal field values";
			[("", (0, (_1, _3)))]
		)
# 314 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 92 "parser.mly"
  ( set_fields _1 )
# 321 "parser.ml"
               : 'config))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 96 "parser.mly"
  ( [_1] )
# 328 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fields) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 98 "parser.mly"
  (_3 :: _1)
# 336 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 103 "parser.mly"
  (
			if _3 >= _5 then error "illegal field values";
			(_1, (_3, _5))
		)
# 348 "parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
  ( NOP )
# 354 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'statement) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'opt_statements) in
    Obj.repr(
# 112 "parser.mly"
  ( SEQ(_1, _2) )
# 362 "parser.ml"
               : 'opt_statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cell) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 117 "parser.mly"
  (
			if (fst _1) != 0 then error "assigned x must be 0";
			if (snd _1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, _3)
		)
# 374 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 123 "parser.mly"
  ( SET_VAR(declare_var(_1), _3) )
# 382 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'condition) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'opt_statements) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'next_) in
    Obj.repr(
# 124 "parser.mly"
                                         ( IF_THEN(_2, _4, _5) )
# 391 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'condition) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'opt_statements) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'next_) in
    Obj.repr(
# 127 "parser.mly"
                                           ( IF_THEN(_2, _4, _5) )
# 400 "parser.ml"
               : 'next_))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'opt_statements) in
    Obj.repr(
# 128 "parser.mly"
                          ( _2 )
# 407 "parser.ml"
               : 'next_))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "parser.mly"
      ( NOP )
# 413 "parser.ml"
               : 'next_))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 132 "parser.mly"
        ( COMP(COMP_EQ, _1, _3) )
# 421 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 133 "parser.mly"
         ( COMP(COMP_NE, _1, _3) )
# 429 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 134 "parser.mly"
         ( COMP(COMP_LT, _1, _3) )
# 437 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 135 "parser.mly"
          ( COMP(COMP_GT, _1, _3) )
# 445 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 136 "parser.mly"
         ( COMP(COMP_LE, _1, _3) )
# 453 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'e) in
    Obj.repr(
# 137 "parser.mly"
         ( COMP(COMP_GE, _1, _3) )
# 461 "parser.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 144 "parser.mly"
  (
			if (_2 < -1) || (_2 > 1) then error "x out of range";
			if (_4 < -1) || (_4 > 1) then error "x out of range";
			(_2, _4)
		)
# 473 "parser.ml"
               : 'cell))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 151 "parser.mly"
          ( BINOP(OP_ADD, _1, _3) )
# 481 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'e) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 152 "parser.mly"
            ( BINOP(OP_SUB, _1, _3) )
# 489 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 't) in
    Obj.repr(
# 153 "parser.mly"
    ( _1 )
# 496 "parser.ml"
               : 'e))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 156 "parser.mly"
          ( BINOP(OP_MUL, _1, _3) )
# 504 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 157 "parser.mly"
          ( BINOP(OP_DIV, _1, _3) )
# 512 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 't) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 158 "parser.mly"
          ( BINOP(OP_MOD, _1, _3) )
# 520 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 159 "parser.mly"
    ( _1 )
# 527 "parser.ml"
               : 't))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cell) in
    Obj.repr(
# 162 "parser.mly"
      ( CELL(0, fst _1, snd _1) )
# 534 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'f) in
    Obj.repr(
# 163 "parser.mly"
          ( NEG(_2) )
# 541 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 164 "parser.mly"
      ( CST _1 )
# 548 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 165 "parser.mly"
     ( VAR(get_var(_1)))
# 555 "parser.ml"
               : 'f))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'e) in
    Obj.repr(
# 166 "parser.mly"
                ( _2 )
# 562 "parser.ml"
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
