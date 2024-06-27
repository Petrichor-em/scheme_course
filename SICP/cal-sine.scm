(define (p x)
	(-	(* x 3)
		(* 4 (cube x))))
(define (abs x)
	(if (< x 0)
		(- x)
		x))
(define (cube x)
	(* x x x))
(define (sine angle)
	(if (< (abs angle) 0.01)
		angle
		(p (sine (/ angle 3.0)))))
(display (sine 12.5))
(newline)