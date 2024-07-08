(define (expt b n)
	(define (iter res counter)
		(if (= counter 0)
			res
			(iter (* res b) (- counter 1))))
	(iter 1 n))
(display (expt 2 3))
(newline)