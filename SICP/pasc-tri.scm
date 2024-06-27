(define (pasc x y)
	(cond 	((= y 1)	1)
			((= x y)	1)
			(else (+ (pasc (- x 1) (- y 1))
					 (pasc (- x 1) y)))))
(define (draw-pasc row)
	(define (col-iter r l)
		(if (> l r)
			`end
			(begin
				(display (pasc r l))
				(display " ")
				(col-iter r (+ l 1)))))
	(define (row-iter r)
		(if (> r row)
			`end
			(begin
				(col-iter r 1)
				(newline)
				(row-iter (+ r 1)))))
	(row-iter 1))
(draw-pasc 20)