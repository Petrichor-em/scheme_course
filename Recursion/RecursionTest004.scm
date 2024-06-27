(letrec ((countdown (lambda (x)
	((if (= x 0)
	 	`liftoff
		(begin
			(display x)
			(newline)
			(countdown (- x 1))))))))
(countdown 10))