(define (search f guess)
	(let ((first-try (f guess)))
		(define (iter try last-try)
			(if (close-enough? try last-try)
				try
				(iter (f try) try)))
		(iter first-try guess)))

(define tolerance 0.0000001)

(define (close-enough? x y)
	(<	(abs (- x y))	
		tolerance))

(define (gen-func a)
	(lambda (x)
		(+	(/ x 2)
			(/	a
				(* x 2)))))

(define (sqrt n)
	(search (gen-func n) 1.0))

(display (sqrt 2))
(newline)