(define (search f neg-point pos-point)
	(define midpoint (average neg-point pos-point))
	(if (close-enough? neg-point pos-point)
		midpoint
		(let ((test-value (f midpoint)))
			(if (> test-value 0)
				(search f neg-point midpoint)
				(search f midpoint pos-point)))))	

(define (average x y)
	(/	(+ x y)
		2))

(define (close-enough? x y)
	(< (abs (- x y)) 0.0001))

(define (abs x)
	(if (< x 0)
		(- x)
		x))

(define (f x)
	(-	(* x x)
		2))

(define (positive? x)
	(> x 0))

(define (negative? x)
	(< x 0))

(define (half-interval-method f a b)
	(let 	((a-value (f a))
			(b-value (f b)))
		(cond 	((and (positive? a-value) (negative? b-value))	(search f b-value a-value))
				((and (positive? b-value) (negative? a-value))	(search f a-value b-value))
				(else `Error))))

(display (half-interval-method f 4 5))