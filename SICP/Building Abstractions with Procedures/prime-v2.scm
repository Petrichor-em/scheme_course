(define (check n d)
	(= (remainder n d) 0))

(define (square x)
	(* x x))

(define (smallest-divisor n)
	(define (check-iter i)
		(cond 	((> (square i) n)	n)
				((check n i)		i)
				(else				(check-iter (next i)))))
	(check-iter 2))

(define (next n)
	(if (= n 2)
		3
		(+ n 2)))
(display (smallest-divisor 19999))
(newline)