(define (fib n)
	(define (fib-iter a b)
		(set! n (- n 1))
		(if (= n 0)
			a
			(fib-iter (+ a b) a)))
	(fib-iter 1 0))
(define N 10)
(display (fib N))
(newline)