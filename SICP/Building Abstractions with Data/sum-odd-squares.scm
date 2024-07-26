(define (square x) (* x x))

(define (sum-odd-squares tree)
	(cond 	((null? tree) 0)
			((not (pair? tree))
				(if (odd? tree)
					(square tree)
					0))
			(else (+ (sum-odd-squares (car tree))
					 (sum-odd-squares (cdr tree))))))

(define tree (list 1
				   (list 2 (list 3 4) 5)
				   (list 6 7)))

(display tree)
(newline)

(display (sum-odd-squares tree))
(newline)

(define (even-fibs n)
	(define (fib k)
		(cond 	((= k 1) 1)
				((= k 2) 1)
				(else (+ (fib (- k 1))
						 (fib (- k 2))))))
	(define (next x)
		(if (> x n)
			(list )
			(let ((f (fib x)))
				(if (even? f)
					(cons f (next (+ x 1)))
					(next (+ x 1))))))
	(next 1))

(display (even-fibs 10))
(newline)