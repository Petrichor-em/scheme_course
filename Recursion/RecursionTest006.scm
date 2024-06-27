(define reverse
	(lambda (l)
		(let loop ((l l) (r `()))
			(if (null? l)
				r
				(let ((d (cdr l)))
					(set-cdr! l r)
					(loop d l))))))
(define lst (string->list "HelloWorld!"))
(display (reverse lst))