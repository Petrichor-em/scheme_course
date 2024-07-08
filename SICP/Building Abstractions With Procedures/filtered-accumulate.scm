(define (accmulate combiner null-value term a next b predicate)
	(if (> a b)
		null-value
		(if (predicate (term a))
			(combiner (term a) (accmulate combiner null-value term (next a) next b predicate))
			(accmulate combiner null-value term (next a) next b predicate))))

(define (expmod base exp m)
	(remainder (expt base exp) m))

(define (check a n)
	(= (expmod a n n)
	   (remainder a n)))

(define (prime? n)
	(define (check-iter a n)
		(cond 	((not (check a n))	#f)
				((= a n)			#t)
				(else				(check-iter (+ a 1) n))))
	(check-iter 1 n))

(define (identity x)
	x)

(define (inc x)
	(+ x 1))

(define (sum-of-prime a b)
	(accmulate + 0 identity a inc b prime?))

(display (sum-of-prime 2 100))
(newline)