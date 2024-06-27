(define (factorial x)
	(define (fac-iter y)
		(if (= x y)
			x
			(* y (fac-iter (+ y 1)))))
	(fac-iter 1))
(define N 5)
(display (factorial N))
(newline)