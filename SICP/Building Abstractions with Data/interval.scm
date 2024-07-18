(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
				   (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
	(add-interval x
				  (make-interval (- (upper-bound y))
								 (- (lower-bound y)))))

(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
	      (p2 (* (lower-bound x) (upper-bound y)))
		  (p3 (* (upper-bound x) (lower-bound y)))
		  (p4 (* (upper-bound x) (upper-bound y))))
		(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
	(if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
		(begin (display "Error: Can't divide an interval that includes '0'.\n")
			   (exit))
		(mul-interval x
					  (make-interval (/ 1.0 (upper-bound y))
				  					 (/ 1.0 (lower-bound y))))))

(define (make-interval lb ub)
	(cons lb ub))

(define (lower-bound interval)
	(car interval))

(define (upper-bound interval)
	(cdr interval))

(define (print-interval interval)
	(display "(")
	(display (lower-bound interval))
	(display ", ")
	(display (upper-bound interval))
	(display ")")
	(newline))

(define (make-center-width c w)
	(make-interval (- c w) (+ c w)))

(define (center i)
	(/ (+ (lower-bound i) (upper-bound i))
	   2))

(define (width i)
	(/ (- (lower-bound i) (upper-bound i))
	   2))

(define (make-center-percent c p)
	(let ((w (* c p)))
		(make-center-width c w)))

(define (percent interval)
	(/ (width interval)
	   (center interval)))

(define (par1 r1 r2)
	(div-interval (mul-interval r1 r2)
				  (add-interval r1 r2)))

(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
		(div-interval one
					  (add-interval (div-interval one r1)
					  				(div-interval one r2)))))

(define r1 (make-center-percent 6 0.1))
(define r2 (make-center-percent 3 0.1))

(print-interval r1)
(print-interval r2)
 
;(print-interval (par1 r1 r2))
;(print-interval (par2 r1 r2))

(print-interval (div-interval r1
							  r1))
(print-interval (div-interval r1
							  r2))

(define r3 (make-center-percent 6 0.01))
(define r4 (make-center-percent 3 0.01))

(print-interval (div-interval r3
							  r3))
(print-interval (div-interval r3
							  r4))