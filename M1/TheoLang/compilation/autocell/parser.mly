/*
 * autocell - AutoCell compiler and viewer
 * Copyright (C) 2021  University of Toulouse, France <casse@irit.fr>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

%{

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

%}

%token EOF

/* keywords */
%token DIMENSIONS
%token NOP

%token IF
%token ELSE
%token ELSIF
%token THEN 
%token WHEN 
%token OTHERWISE

%token END
%token OF

/* symbols */
%token ASSIGN
%token COMMA
%token LBRACKET RBRACKET
%token OPARA FPARA
%token DOT_DOT
%token DOT


%token PLUS MINUS
%token MULT DIV MOD
%token EQ NE LT GT LE GE

/* values */
%token <string> ID
%token <int> INT

%token 

%start program
%type<Ast.prog> program

%%

program: INT DIMENSIONS OF config END opt_statements EOF
	{
		if $1 != 2 then error "only 2 dimension accepted";
		($4, $6)
	}

config:
	INT DOT_DOT INT
		{
			if $1 >= $3 then error "illegal field values";
			[("", (0, ($1, $3)))]
		}
|	fields
		{ set_fields $1 }

fields:
	field
		{ [$1] }
|	fields COMMA field
		{$3 :: $1}


field:
	ID OF INT DOT_DOT INT
		{
			if $3 >= $5 then error "illegal field values";
			($1, ($3, $5))
		}

opt_statements:
	/* empty */
		{ NOP }
|   statement opt_statements
		{ SEQ($1, $2) }


statement:
	cell ASSIGN e
		{
			if (fst $1) != 0 then error "assigned x must be 0";
			if (snd $1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, $3)
		}
|	ID ASSIGN e	{ SET_VAR(declare_var($1), $3) }
|	IF condition THEN opt_statements next_ { IF_THEN($2, $4, $5) }

|	ID ASSIGN when_ { make_when(fonc e -> SET_VAR(declare_var($1, e), $3) )}
|	cell ASSIGN when_
		{
			if (fst $1) != 0 then error "assigned x must be 0";
			if (snd $1) != 0 then error "assigned Y must be 0";
			make_when( fonc e -> SET_CELL(0, e), $3)
		}

when_:
	e WHEN condition COMMA when_ { ($1, $3) :: $5 }
	e OTHERWISE { [($1, NO_COND)] }

/*  cell ASSIGN when_ {
		if (fst $1) != 0 then error "assigned x must be 0";
		if (snd $1) != 0 then error "assigned Y must be 0";
		let( ) = $3 in
		IF_THEN( , , )
	} 
|	ID ASSIGN when_ { NOP }
  ID ASSIGN when_ { IF_THEN( , , ) } 

statement:
	cell ASSIGN e
		{
			if (fst $1) != 0 then error "assigned x must be 0";
			if (snd $1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, $3)
		}
|	cell ASSIGN e WHEN condition COMMA when_
		{
			if (fst $1) != 0 then error "assigned x must be 0";
			if (snd $1) != 0 then error "assigned Y must be 0";
			IF_THEN($5, SET_CELL(0, $3), $1 ASSIGN $3)
		}
|	ID ASSIGN e	{ SET_VAR(declare_var($1), $3) }
|	ID ASSIGN when_ {
		let (cond, expr, next) = $3 in
		IF_THEN(cond, SET_VAR(declare_var($1), expr), $1 ASSIGN next)
	}
|	IF condition THEN opt_statements next_ { IF_THEN($2, $4, $5) }

when_:
	e WHEN condition COMMA when_ {
		let (cond, expr, next) = $5 in
		IF_THEN(cond, SET_VAR
	}
|	e OTHERWISE { $1 }*/

next_: 
	ELSIF condition THEN opt_statements next_ { IF_THEN($2, $4, $5) }
|	ELSE opt_statements END { $2 }
|	END { NOP }

condition:
	e EQ e { COMP(COMP_EQ, $1, $3) }
|	e NE e { COMP(COMP_NE, $1, $3) }
|	e LT e { COMP(COMP_LT, $1, $3) }
| 	e GT e { COMP(COMP_GT, $1, $3) }
|	e LE e { COMP(COMP_LE, $1, $3) }
|	e GE e { COMP(COMP_GE, $1, $3) }

cell:
	LBRACKET INT COMMA INT RBRACKET
		{
			if ($2 < -1) || ($2 > 1) then error "x out of range";
			if ($4 < -1) || ($4 > 1) then error "x out of range";
			($2, $4)
		}

e:
	e PLUS t { BINOP(OP_ADD, $1, $3) }
|	e MINUS t { BINOP(OP_SUB, $1, $3) }
|	t { $1 }

t:
	t MULT f { BINOP(OP_MUL, $1, $3) }
|	t DIV f { BINOP(OP_DIV, $1, $3) }
|	t MOD f { BINOP(OP_MOD, $1, $3) }
|	f { $1 }

f:
	cell { CELL(0, fst $1, snd $1) }
|	MINUS f { NEG($2) }
|	INT { CST $1 }
|	ID { VAR(get_var($1))}
|	OPARA e FPARA { $2 }
;




