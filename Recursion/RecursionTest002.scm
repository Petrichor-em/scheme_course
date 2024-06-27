(define is-even?
	(lambda (x)
		(if (= x 0)
			#t
			(is-odd? (- x 1))	
		)	
	)
)

(define is-odd?
	(lambda (x)
		(if (= x 0)
			#f
			(is-even? (- x 1))	
		)	
	)
)

(display (is-odd? 21))
(newline)