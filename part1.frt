: parity 2 % not ;

: prime
	dup 2 < 
	if drop 0
	else dup 4 < 
		if drop 1
		else 0 swap dup 2 / 2 do
			dup r@ %
				if 
				else swap 1 + swap 
				then 
			loop
			drop 0 = 
				if 1 
				else 0 
				then
		then
	then ;
  
: alloc 8 allot dup rot swap ! ;

: primar
dup 0 < 
	if dup 2 * - 
	then
	2
	repeat 
 		over over dup * %
 			if 1 + over over dup * <
				if 1 1 
				else 0 
				then
        		else 0 1 
			then 
until ;

: concat 
dup count rot
dup count rot
over + 1 +
heap-alloc
rot swap dup rot
string-copy
dup rot + rot
string-copy ;
