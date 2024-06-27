(define (factorial x)
	(if (= x 0)
		1
		(* x (factorial (- x 1)))))
(define N 5)
(display (factorial N))
(newline)