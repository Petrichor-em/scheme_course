(define (square x) (* x x))
(define (fib x)
	(cond 	((= x 1) 1)
			((= x 2) 1)
			(else (+ (fib (- x 1))
					 (fib (- x 2))))))

(define (filter predicate sequence)
	(if (null? sequence)
		(list )
		(let ((address (car sequence)))
			(if (predicate address)
				(cons address (filter predicate (cdr sequence)))
				(filter predicate (cdr sequence))))))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
	(if (> low high)
		(list )
		(cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
	(cond 	((null? tree) (list ))
			((not (pair? tree)) (list tree))
			(else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))

(define tree (list 1 (list 2 (list 3 4)) 5))

(define (sum-odd-squares tree)
	(accumulate +
				0
				(map square
					 (filter odd?
					 		 (enumerate-tree tree)))))

;(display (sum-odd-squares tree))
;(newline)

(define (even-fibs n)
	(accumulate cons
				(list )
				(filter even?
						(map fib
							 (enumerate-interval 1 n)))))

;(display (even-fibs 40))
;(newline)

(define (list-fib-squares n)
	(accumulate cons
				(list )
				(map square
					 (map fib
					 	  (enumerate-interval 1 n)))))

;(display (list-fib-squares 10))	
;(newline)

(define (product-of-squares-of-odd-elements sequence)
	(accumulate *
				1
				(map square
					 (filter odd? sequence))))
					
(display (product-of-squares-of-odd-elements (list 1 2 3 4 5)))
(newline)