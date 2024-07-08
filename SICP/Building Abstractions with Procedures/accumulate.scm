; Recursion
(define (accmulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accmulate combiner null-value term (next a) next b))))

; Iteration
(define (accmulate2 combiner null-value term a next b)
	(define (iter res counter)
		(if (> counter b)
			res
			(iter (combiner res (term counter)) (next counter))))
	(iter null-value a))

(define (sum f a b next)
	(accmulate + 0 f a next b))

(define (prod f a b next)
	(accmulate * 1 f a next b))

(define (factorial n)
	(define (identity x)
		x)
	(define (inc i)
		(+ i 1))
	(prod identity 1 n inc))

(define (sum-of-integer n)
	(define (identity x)
		x)
	(define (inc i)
		(+ i 1))
	(sum identity 1 n inc))


(display (factorial 5))
(newline)
(display (sum-of-integer 5))
(newline)