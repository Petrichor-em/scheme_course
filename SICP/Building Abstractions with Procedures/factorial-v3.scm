(define (factorial x)
	(define counter 0)
	(define (fac-iter)
		(if (= counter x)
			1
			(begin
				(set! counter (+ counter 1))
				;(display counter)
				;(newline)
				(* counter (fac-iter)))))
	(fac-iter))
(define N 5)
(display (factorial N))
(newline)