(define (add-rat x y)
	(make-rat (+	(*	(numer x) (denom y))
					(*	(numer y) (denom x)))
			  (* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (-	(*	(numer x) (denom y))
					(*	(numer y) (denom x)))
			  (* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
			  (* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
			  (* (numer y) (denom x))))	

(define (equal-rat? x y)
	(=	(* (numer x) (denom y))
		(* (numer y) (denom x))))

 (define (gcd a b)
    (if (= b 0)
	    a
	    (gcd b (remainder a b))))

(define (make-rat n d)
	(let ((g (gcd (abs n) (abs d)))
		  (new-n (if (is-neg? d)
		  			(- n) n))
		  (new-d (if (is-neg? d)
		  			(- d) d)))
		(cons (/ new-n g) (/ new-d g))))

(define (numer x)
	(car x))

(define (denom x)
	(cdr x))

(define (print-rat x)
	(display (numer x))
	(display "/")
	(display (denom x))
	(newline))

(define (is-neg? x)
	(< x 0))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat one-third)

(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))

(define minus-one-half (make-rat 1 (- 2)))
(print-rat minus-one-half)
(print-rat (add-rat minus-one-half one-third))