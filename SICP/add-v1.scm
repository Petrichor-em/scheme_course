(define (add a b)
	(if (= a 0)
		b
		(+ 1 (add (- a 1) b))))
(display (add 5 6))
(newline)