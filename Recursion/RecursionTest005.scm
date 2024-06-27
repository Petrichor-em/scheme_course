(define list-position
	(lambda (o l)
		(let loop ((i 0) (l l))
			(if (null? l)
				#f
				(if (eqv? o (car l))
					i
					(loop (+ i 1) (cdr l)))))))
(define obj #\e)
(define lst (string->list "HelloWorld!"))
(define index (list-position obj lst))
(display index)