(define (divide? n d)
	(= (remainder n d) 0))

(define (square x)
	(* x x))

(define (smallest-divisor n)
	(define (find test-divisor)
		(cond 	((> (square test-divisor) n)	n)
				((divide? n test-divisor)		test-divisor)
				(else							(find (+ test-divisor 1)))))
	(find 2))
(display (smallest-divisor 19999))
(newline)