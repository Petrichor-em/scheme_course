(define (double x)
	(+ x x))

(define (halve x)
	(/ x 2))

(define (can-double? x s)
	(< (+ x x) s))

(define (* a b)
	(define (mtp-iter sum add-num counter)
		(if (= b counter)
			sum
			(if (can-double? counter b)
				(mtp-iter (double sum) add-num (double counter))
				(mtp-iter (+ sum add-num) add-num (+ counter 1)))))
	(mtp-iter a a 1))
(display (* 5 6))
(newline)
(display (* 6 6))
(newline)
(display (* 8 9))
(newline)