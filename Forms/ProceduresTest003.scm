(define x (list 1 2 3 4))
(display (apply + 1 2 3 4 x))
(newline)
(define sum
	(apply + 1 2 3 4 5 (list))
)
(display sum)
(newline)
(define print
	(lambda (arg1 arg2 arg3)
		(begin
			(display arg1)	
			(display " ")
			(display arg2)	
			(display " ")
			(display arg3)	
			(display " ")
		)	
	)
)

(print "I" "Love" "You")
(newline)