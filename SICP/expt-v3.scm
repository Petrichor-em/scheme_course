
(define (expt b n)
	(define (expt-iter-odd product counter)
		(if (= counter 0)
			product
			(expt-iter-odd (* product b) (- counter 1))))
	(define (expt-iter-even product counter)
		(if (= counter 0)
			product
			(expt-iter-even (* product b b) (- counter 2))))
	(define (is-even? x)
		(if (= (/ x 2) 0)
			#t
			#f))
	(if (is-even? n)
		(expt-iter-even 1 n)
		(expt-iter-odd 1 n)))
(display (expt 5 4))