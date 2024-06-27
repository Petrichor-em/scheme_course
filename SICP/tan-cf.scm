(define (tan-cf x k)
	(define (iter i)
		(if (> i k)
			(p i)
			(-	(p i)
				(sqdi x (iter (+ i 1.0))))))
	(/	x
		(iter 1)))

(define (p x)
	(-	(* x 2)
		1))

(define (sqdi x y)
	(/	(* x x)
		y))

(display (tan-cf 5 100))
(newline)