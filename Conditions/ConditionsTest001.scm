(define y 80)
(define print_true
	(lambda ()
		(display "true\n")	
	)
)
(define print_false
	(lambda ()
		(display "false\n")	
	)
)
(if (> y 70)
	(print_true)
	(print_false)
)	
(newline)
(when (> y 70)
	(display "a is ")
	(display y)
	(newline)
	(display "y > 70")
	(newline)
)