(define x 10)
(define foo
	(lambda ()
		(begin
			(define x 20)	
			(display x)
		)
	)
)
(foo)
(newline)
(display x)
(newline)