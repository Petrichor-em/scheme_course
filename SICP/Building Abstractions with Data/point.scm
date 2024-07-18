(define (make-segment point-a point-b) 
	(cons point-a point-b))

(define (start-segment segment)
	(car segment))

(define (end-segment segment)
	(cdr segment))

(define (make-point x y)
	(cons x y))

(define (x-point point)
	(car point))

(define (y-point point)
	(cdr point))

(define (midpoint-segment segment)
	(let ((start-x	(x-point (start-segment segment)))
		  (start-y	(y-point (start-segment segment)))
		  (end-x	(x-point (end-segment segment)))
		  (end-y	(y-point (end-segment segment))))
		(make-point (sum-half start-x end-x) (sum-half start-y end-y))))

(define (sum-half x y)
	(/ (+ x y)
	   2))

(define (print-point p)
	(display "(")
	(display (x-point p))
	(display ", ")
	(display (y-point p))
	(display ")")
	(newline))

(define point-1 (make-point 1 1))
(define point-2 (make-point 2 3))
(define segment-1 (make-segment point-1 point-2))
(define midpoint-1 (midpoint-segment segment-1))
(print-point midpoint-1)