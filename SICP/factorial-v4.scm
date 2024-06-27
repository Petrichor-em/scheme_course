(define (factorial n)
	(fact-iter 1 1 n))
(define (fact-iter product counter max-count)
	(if (> counter max-count)
		product
		(fact-iter (* product counter ) (+ counter 1) max-count)))
(define N 5)
(display (factorial N))
(newline)