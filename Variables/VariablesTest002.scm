(define counter 0)
(define CLK
	(lambda ()	
		(set! counter (+ counter 1))
	)
)

(define tick	
	(lambda ()
		(begin
			(CLK)	
			(display counter)
			(newline)
		)	
	)
)

(tick)
(tick)
(tick)
(tick)