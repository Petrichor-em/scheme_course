(define foo
	(lambda ()
		(let ((x 1)
			(y 2)
			(z 3))	
			(list x y z))
	)
)

(display (foo))
(newline)