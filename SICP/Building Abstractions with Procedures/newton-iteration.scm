(define dx 0.0000001)
(define (D g) 
	(lambda (x)
		(/	(-	(g (+ x dx))
				(g x))
			dx)))

(define (f g)
	(lambda (x)
		(-	x
			(/	(g x)
				((D g) x)))))

(define (search g guess)
	(let* ((F (f g))
			(first-try (F guess)))
		(define (iter try last-try)
			(if (close-enough? try last-try)
				try
				(iter (F try) try)))
		(iter first-try guess)))	

(define tolarance 0.0000001)

(define (close-enough? x y)
	(<	(abs (- x y))
		tolarance))

(define (g x)
	(-	(* x x)
		3))

(display (search g 1.0))
(newline)