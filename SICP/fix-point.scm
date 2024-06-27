(define (fixed-point f first-guess)
	(define (iter try last-try)
		(if (close-enough? try last-try)
			try
			(iter (f try) try)))
	(iter (f first-guess) first-guess))

(define (close-enough? x y)
	(<	(abs (- x y))
		0.00001))

(define (abs x)
	(if (< x 0)
		(- x)
		x))

(define (f x)
	(+	1
		(/ 1 x)))

(display (fixed-point f 1.0))
(newline)