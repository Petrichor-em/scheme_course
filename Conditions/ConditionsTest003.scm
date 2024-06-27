(define N 30)
(define print
	(lambda (num1 relation num2)
		(begin
			(display num1)
			(display " ")
			(display relation)
			(display " ")
			(display num2)
			(newline)
		)	
	)
)

(cond ((< N 10) (print N #\< 10))
	((= N 10) (print N #\= 10))
	(else (print N #\> 10))	
)