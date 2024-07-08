(define (prod f a b next)
	(if (> a b)
		1
		(* (f a) (prod f (next a) b next))))

(define (prod2 f a b next)
	(define (iter res counter)
		(if (> counter b)
			res
			(iter (* res (f counter)) (next counter))))
	(iter 1 a))

(define (factorial n)
	(define (identity x)
		x)
	(define (inc i)
		(+ i 1))
	(prod2 identity 1 n inc))

(define (cal-pi ul)
	(define (term x)
		(*	(/	(- x 1.0)
				x)
			(/	(+ x 1.0)
				x)))
	(define (inc x)
		(+ x 2.0))
	(* 4.0 (prod2 term 3.0 ul inc)))

(display (factorial 5))
(newline)
(display (cal-pi 1999999))
(newline)