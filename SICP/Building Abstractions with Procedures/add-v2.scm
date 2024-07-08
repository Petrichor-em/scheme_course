(define (add a b)
	(if (= a 0)
		b
		(add (- a 1) (+ b 1))))
(display (add 5 6))
(newline)