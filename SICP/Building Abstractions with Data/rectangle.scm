(define (make-rectg-1 x y)
	(cons x y))

(define flag 1)

(define (make-rectg-2 bottom-left top-right)
	(list bottom-left top-right flag))

(define (length rectg)
	(if (list? rectg)
		(- (x-point (cadr rectg))
		   (x-point (car rectg)))
		(car rectg)))

(define (width rectg)
	(if (list? rectg)
		(- (y-point (cadr rectg))
		   (y-point (car rectg)))
		(cdr rectg)))

(define (area rectg)
	(* (length rectg)
	   (width rectg)))

(define (circumference rectg)
	(* (+ (length rectg)
	      (width rectg))
       2))

(define (make-point x y)
	(cons x y))

(define (x-point point)
	(car point))

(define (y-point point)
	(cdr point))

(define rectg-1 (make-rectg-1 4 5))
(display (area rectg-1))
(newline)
(display (circumference rectg-1))
(newline)

(define point-a (make-point 0 0))
(define point-b (make-point 2 2))
(define rectg-2 (make-rectg-2 point-a point-b))
(display (area rectg-2))
(newline)
(display (circumference rectg-2))
(newline)