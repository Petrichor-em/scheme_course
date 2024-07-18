(define (cons a b)
	(* (pow 2 a)
	   (pow 3 b)))

(define (car z)
	(define (iter n counter)
		(if (integer? (/ n 2))
			(iter (/ n 2) (+ counter 1))
			counter))
	(iter z 0))

(define (cdr z)
	(define (iter n counter)
		(if (integer? (/ n 3))
			(iter (/ n 3) (+ counter 1))
			counter))
	(iter z 0))

(define (pow b p)
	(if (= p 1)
		b
		(* b (pow b (- p 1)))))

(display (car (cons 1 2)))
(newline)

(display (cdr (cons 1 2)))
(newline)