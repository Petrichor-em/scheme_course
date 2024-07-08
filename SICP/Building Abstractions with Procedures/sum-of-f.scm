(define (sum f a b next)
	(if (> a b)
		0
		(+	(f a)
			(sum f (next a) b next))))

; iteration process
(define (sum2 f a b next)
	(define (iter res counter)
		(if (> counter b)
			res
			(iter (+ res (f counter)) (next counter))))
	(iter 0 a))

(define (sum-of-cubes a b)
	(define (cube x)
		(* x x x))
	(define (inc x)
		(+ x 1))
	(sum cube a b inc))

(define (sum-of-integer a b)
	(define (indentity x)
		x)
	(define (inc x)
		(+ x 1))
	(sum indentity a b inc))

(define (pi-sum a b)
	(define (f x)
		(/	1.0
			(*	x
				(+ x 2))))
	(define (inc x)
		(+ x 4))
	(sum f a b inc))

(define (definite-integral f a b dx)
	(define (inc x)
		(+ x dx))
	(* 	dx
		(sum f (+ a (/ dx 2)) b inc)))

(define (cube x)
	(* x x x))

(define (simpson-integral f a b n)
	(define (even? x)
		(= (remainder x 2) 0))
	(define h (/	(- b a)
					n))
	(define (y k)
		(f (+	a
				(* k h))))
	(define (si-term i)
		(cond 	((or (= i 0) (= i n))	(y i))
				((even? i)				(* 2 (y i)))
				(else					(* 4 (y i)))))
	(define (inc x)
		(+ x 1))
	(*	(/ h 3)
		(sum2 si-term 0 n inc)))
(define (square x)
	(* x x))
(display (simpson-integral cube 0 1 1000))
(newline)
(display (simpson-integral square 0 1 1000))
(newline)
(display (simpson-integral sin 0 3.1415926 1000))
(newline)