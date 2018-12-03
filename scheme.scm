#lang racket

#| The first class object may be expressed as an anonymous literal value
(constant). Show an example of the anonymous function and its use.|#

((lambda (n) (* n n) ) 32)
((lambda (a b) (sqrt (* a b))) 4 9)

#| The first class object may be stored in variables (i.e. it may have a symbolic
name). Show examples of defining and using named functions.|#

(define sq (lambda (n) (* n n)))
(pp (sq))
	;;; prints out sq
	 <PROCEDURE SQ> =
	        (LAMBDA (N) (* N N))
(sq 32)

#| The first class object may be stored in data structures. Show an example of a
data structure (e.g. a list) that contains functions.|#

(define fl (list (lambda (n) (* n n)) (lambda (a b) (sqrt (* a b)))))

fl
	 <PROCEDURE> <PROCEDURE> 

(cdr fl)
	 <PROCEDURE> 

((car fl) 32)

(pp (car fl))
	 <PROCEDURE> =
	      (LAMBDA (N) (* N N)) 

(pp (cadr fl))
	 <PROCEDURE>
	      (LAMBDA (A B) (SQRT (* A B))) 

(pp (cdr fl))
	 <PROCEDURE> 

((cadr fl) 4 9)

#| The first class object may be comparable to other objects for equality. Show
an example of comparing functions and lists for equality. |#

(equal? (cadr fl) (cadr fl))

(equal? (car fl) (lambda (n) (* n n)))

(equal? (lambda(n) (* n n)) (lambda (n) (* n n)))

(eq? (car fl) (car fl))

(eq? '(1 2 3)' '(1 2 3)')

(equal? '(1 2 3)' '(1 2 3)')

L

(equal? L '(1 2 3) ') ;same type and value

(eqv? L '(1 2 3)') ;numerically equal atoms

(eq? L L) ;pointer identity

#| The first class object may be passed as a parameter to procedures/functions. Show
an example of passing function as an argument to another function. |#

((lambda (op arg)(op arg)) (lambda(n) (* n n)) 32)

((lambda (op arg)(op (op arg))) (lambda(n) (* n n) 2)

((lambda (op arg) (op arg)) (car fl) 32)

fl
 <PROCEDURE> <PROCEDURE> 

(display fl)
 <PROCEDURE> <PROCEDURE> 

(display (car fl))
 <PROCEDURE> 

(pp (car fl))
 <PROCEDURE> = 
		(LAMBDA (N) (* N N))  

(define geo (cadr fl))

(geo 4 9)

#| The first class object may be returned as result from procedures/functions. Show an example 
of returning a function as a result of another function. |#

(define compose (lambda (f g) (lambda (x) (f (g x)))))

(pp compose)
 <PROCEDURE COMPOSE> = 
		(LAMBDA (F G)
			(LAMBDA (X) (F (G X))  

(pp sq)
 <PROCEDURE SQ> = 
		(LAMBDA (N) (* N N)) 

((compose sq sq) 2)

((compose sqrt sqrt) 16)

((compose (lambda(n) (* n n)) (lambda(n) (* n n))) 2)

((compose (car fl)(car fl)) 2)

(define power4 (compose (car fl)(car fl)))

(pp power4)
 <PROCEDURE COMPOSE> =
		(LAMBDA (X) (F (G X))) 

(power4 2)

(define f (read))

(display f)
 (LAMBDA (N) (* N N)) 

f
 (LAMBDA (N) (* N N)) 

(procedure? f)

(procedure? (eval f))

((eval f) 32)

(pp (eval f))
 <PROCEDURE> =
		(LAMBDA (N) (* N N)) 

(pp f)
 (LAMBDA (N) (* N N)) 

#| The first class object may be readable and printable. Show examples
of reading functions from the keyboard, reading functions from a file, 
and displaying a function |#

#| Fun.dat contains three rows: 
		Square function
		Geometric mean
		Pythagorian Theorem for Hypotenuse |#

#| Create fun.dat using scheme |#
#| \SCHEME>type fun.dat |#

(lambda (n) (* n n))

(lambda (a b) (sqrt (* a b)))

(lambda (a b) (sqrt (+ (* a a) (* b b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#| Reading dat file |#

((eval (read)) 32)

(lambda (n) (* n n))

(define importFile (open-input-file "Fun.dat"))
#| IMPORT |#

(define f (read importFile))
#| F |#

f

((eval f) 32)

(define g (read importFile))

(display g)
#| (LAMBDA (A B) (SQRT (* A B))) |#

((eval g) 4 9)

(define pyt (read importFile))

pyt
#| (LAMBDA (A B) (SQRT (+ (* A A) (* B B)))) |#

((eval pyt) 3 4)	

(define F)

(set! F (lambda (n) (* n n))) ;assignment of procedure
#| <PROCEDURE> |# 

(F 32)

((eval F) 32)

(set! F (read))

F

(F 32)

((lambda (n) (* n n)) 32)

((eval F) 32)

#|****************************************************************************|#

#| The mean value of n numbers is |x| = (X1 + ... + Xn)/n. The mean value of n squares
is |x^2| = (X1^2 + ... + Xn^2)/n. The standard deviation is defined as sigma = sqrt(|x^2| - 
(|x|^2)). Write a scheme function sigma that computes the standard deviation of any number of 
arguments, as in the following example: |#

(sigma 1 2 3 2 1)
#| 0.748331477354788 |#
(sigma 1 3 1 3 1 3)
#| 1. |#
(sigma 1 3)
#| 1. |#
(sigma 1)
#| 0. |#

#| Solution 1 |#
(define (sumlist lst))
	(if (null? lst) 0 (+ (car lst)(sumlist(cdr lst))))
(define (sumqlist lst))

(define sigma (lambda x) 
	(sqrt(- (/(sumsqlist x)(length x)) 
		(expt (/ (sumlist x) (length x)) 2)))

#| Solution 2 |#
(define (sq x)(* x x))

(define (mean lst) (/ (apply + lst) (length lst)))

(define (meansq lst) (/ (apply + (map sq lst)) (length lst)))

(define (sigmalist lst) (sqrt (- (meansq lst)(sq (mean lst)))))

(define (sigma . x) (sqrt (- (meansq x) (sq (mean x))))) ; nargs > 0

(define (sig . x) (sigmalist x)) ;nargs > 0

(define (sigmal x . y) (sigmalist (append (list x) y))) ;nargs >= 0

#| Write a recursive Scheme procedure line that prints n asterisks in a line as follows:
(line 5)
* * * * *
|#

(define (line n)
	 (cond 
		((not (integer? n)) (newline)) 
		((<= n 0) (newline))
		(else (display "*") (line (- n 1)))
		)
	 )

#| Write a recursive Scheme procedure histogram that uses the procedure line, and prints a
histogram for a list of integers: 
(histogram '(1 2 3 3 2 1)')
*
* *
* * *
* * *
* * 
*
|#

(define (line1 n)
	(cond
		((not (integer? n)) (display ""))
		((<= n 0) (newline) (display ""))
		(else (display "*") (line1 (- n 1)))
		)
	)


(define (histogram lst)
	(cond 
		((null? lst) (display ""))
		(else (line (car lst))
				(histogram (cdr lst)))
		)
	)
#| Write a nonrecursive procedure hist, that uses for-each operator and works in the same way
as the procedure histogram. |#

(define (hist lst)
	(begin (for-each list lst) (display "")))

#| Write a procedure vhist that is equivalent to histogram, but instead of list uses a vector 
of integers. |#

(define (vhist vec)
	(hist (vector -> list vec)))

(define (list? lst)
	(cond ((null? lst))
		((not (pair? lst)))
		(else (list? (cdr lst)))
		)
	)

#| Write a histogram presentation procedure (lvhist x) where x can be either a vector of a list. |#

(define (lvhist x)
	(cond
		((list? x) (histogram x))
		((vector? x) (vhist x))
		(else (display "Wrong argument type"))
		)
	)

#|****************************************************************************|#

#| Write a Scheme program for computing a maximum of function f(x) within the interval [x1, x2].
Use the trisection method, and find the coordinate of maximum xmax with accuracy of 6 significant
decimal digits. |#

(define disp
	(lambda (x n)
		(display (/ (round (* x (expt 10 n))) (expt 10 n)))))

(define fmax
	(lambda (f x1 x2)
		(cond 
			((< (- x2 x1) le-10
				(display "Maximum: f (")
				(disp (/ (+ x1 x2) 2) 4)
				(display ") = ")
				(disp (f (/ (+ x1 x2) 2)) 4))
			(else (let ((a1 (+x1 (/ (-x2 x1) 3)))
						(a2 (-x2 (/ (-x2 x1) 3))))
					(if (< (f a1) (f a2)))
						(fmax f a1 x2)
						(fmax f x1 a2))
					)
				)
			)
		)
	)
	
(fmax cos -1 1)
#| Maximum: f(0) = 1 |#

(fmax (lambda (x) (+ x (/ 1 x))) 0.01 100)
#| Maximum: f(100) = 100.01 |#

(fmax (lambda (x) (- (/ -1 x) x)) 0.01 100)
#| Maximum: f(1) = -2 |#

(fmax (lambda (x) x) 0 10)
#| Maximum: f(10) = 10 |# 

(fmax (lambda (x) (minus x)) 0 10)
#| Maximum: f(0) = 0 |#

#|****************************************************************************|#

#| Develop a program that computes the scalar product of two vectors. The program must
not accept vectors having different size (in such a case print an error message). For example:

>(scalar-product '#(1 2 3)' '#(2 1 1)')
7
> (scalar-product '#(1 2 3)' '#(1 2 3 4 5)')
ERROR: Different sizes of vectors! 
|#

#| Write a program in iterative style using the DO loop. |#

#|******************ITERATIVE VERSION******************|#

#<PROCEDURE SP> = 
 (LAMBDA (V1 V2)
 	(cond ((<> (VECTOR-LENGTH V1)(VECTOR-LENGTH V2))
 				(display "Error: different sizes of vector!"))
 			((ZERO? (VECTOR-LENGTH V1))
 				(display "Error: empty vectors!"))
 			(else (let ((S 0))
 					(DO ((I 0 (ADD1 I)))
 							((>= I (VECTOR-LENGTH V1)) (display S))
 							(set! S 
 								(+ S (* (VECTOR-REF V1 I) (VECTOR-REF V2 I)
 								)
 							)
 						)
 					)
 				)
 			)
 		)
 	)
(sp '#() '#())

(sp '#(1 2 3) '#(1 2))

(sp '#(1 2 3) '#(2 1 1))

(sp '#(1 2 3 4) '#(-4 -3 2 1))

#|******************RECURSIVE VERSION WITH LISTS******************|#

(pp splist)

#<PROCEDURE SPLIST> = 
	(LAMBDA (LIST1 LIST2)
		(cond ((null? (cdr LIST1)) (*car LIST1) (car LIST2)))
			(else (+ (* (car LIST1) (car LIST2))
					(SPLIST (cdr LIST1) (cdr (LIST2)))
				)
			)
		)

(pp sprec)

#<PROCEDURE SPREC> = 
	(LAMBDA (V1 V2)
		(cond ((<> (VECTOR-LENGTH V1) (VECTOR-LENGTH V2))
				(display "Error: different sizes of vectors!"))
			((ZERO? (VECTOR-LENGTH V1))
				(display "Error: empty vectors!"))
					(else (SPLIST (VECTOR -> LIST V1) (VECTOR -> LIST V2)
						)
				)
			)
		)
	
#|******************RECURSIVE VERSION WITH VECTORS******************|#

(pp dot-product)

#<PROCEDURE DOT-PRODUCT> = 
	(LAMBDA (V1 V2 N)
		(cond ((= 1 N) (* (VECTOR-REF V1 0) (VECTOR-REF V2 0)))
			(else (+ (* (VECTOR-REF V1 (SUB1 N))
						(VECTOR-REF V2 (SUB1 N)))
					(DOT-PRODUCT V1 V2 (SUB1 N))
					)
			)
		)
	)

(pp spvec)
#<PROCEDURE SPVEC> = 
	(LAMBDA (V1 V2)
		(cond ((<> (VECTOR-LENGTH V1) (VECTOR-LENGTH V2))
				(display "Error: different sizes of vectors!"))
			((ZERO? (VECTOR-LENGTH V1))
				(display "Error: empty vectors!"))
			(else (DOT-PRODUCT V1 V2 (VECTOR-LENGTH V1))
				)
			)
		)
