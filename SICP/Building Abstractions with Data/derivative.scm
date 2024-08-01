(define (error msg)
	(display msg)
	(newline)
	(exit))

(define (variable? e)
	(symbol? e))
(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? e)
	(and (pair? e) (eq? (car e) `+)))
(define (addend e)
	(cadr e))
(define (augend e)
	(if (= (length e) 3)
		(caddr e)
		(append `(+) (cddr e))))
(define (=number? exp num)
	(and (number? exp) (= exp num)))
(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2)) (+ a1 a2))
		  (else (list `+ a1 a2))))
(define (product? e)
	(and (pair? e) (eq? (car e) `*)))
(define (multiplier e)
	(if (= (length e) 3)
		(caddr e)
		(append `(*) (cddr e))))
(define (multiplicand e)
	(cadr e))
(define (make-product m1 m2)
	(cond ((=number? m1 0) 0)
		  ((=number? m2 0) 0)
		  ((=number? m1 1) m2)
		  ((=number? m2 1) m1)
		  ((and (number? m1) (number? m2)) (* m1 m2))
		  (else (list `* m1 m2))))
(define (exponentiation? e)
	(and (pair? e) (eq? (car e) `**)))
(define (base e)
	(cadr e))
(define (exponent e)
	(caddr e))
(define (make-exponentiation b e)
	(cond ((= e 0) 1)
		  ((= e 1) b)
		  (else (list `** b e))))

(define (deriv exp var)
	(cond ((number? exp) 0)
		  ((variable? exp)
				(if (same-variable? exp var)
					1
					0))
		  ((sum? exp)
		  		(make-sum (deriv (addend exp) var)
						  (deriv (augend exp) var)))
		  ((product? exp)
		  		(make-sum (make-product (deriv (multiplicand exp) var)
										(multiplier exp))
						  (make-product (deriv (multiplier exp) var)
										(multiplicand exp))))
		  ((exponentiation? exp)
		  		(make-product (exponent exp)
							  (make-product (make-exponentiation (base exp) (- (exponent exp) 1))
							  				(deriv (base exp) var))))
		  (else (error "unknown expression type."))))

(display (deriv `(+ x 3) `x))
(newline)
(display (deriv `(* x y) `x))
(newline)
(display (deriv `(* x y (+ x 3)) `x))
(newline)
(display (deriv `(*(** x 5) (+ x 5)) `x))
(newline)