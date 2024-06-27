(define X 10)
(define add2
	(lambda (x)
		(+ x 2)	
	)
)

(display (add2 X))
(newline)
(set! X 20)
(display (add2 X))
(newline)