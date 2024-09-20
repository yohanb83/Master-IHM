let pi = 3.1415

let print s = print_string s

let peri r = 2. *. pi *. r

let abs x = if x<0 then -x else x

let rec sum n = if n=0 then 0 else n+sum(n-1)

let rec fact n = if n=0 then 1 else n*fact(n-1)

let rec pgcd a b = if b=0 then 
		a
	else if a<b then 
		pgcd b a 
	else 
		pgcd b (a mod b)
		
let rec fib n = if n=0 then 
		0
	else if n=1 then 
		1
	else
		fib(n-1) + fib(n-2)
		
let rec puis x n = if n=0 then 
		1
	else
		x * puis x (n-1)
		
let rec puis_rap x n = if n=0 then 
		1
	else if (n mod 2=0) then 
		let m = puis_rap x (n/2) in
		m * m
	else
		puis_rap x (n-1) * x
		
		
let rec forall p n = if n=0 then 
		true
	else
		p n && forall p (n-1)
		
let rec forall p n = if n=0 then 
		true
	else
		p n && forall p (n-1)
		
let rec exists p n = if n<0 then
		false
	else
		p n || exists p (n - 1)
		
		

		


