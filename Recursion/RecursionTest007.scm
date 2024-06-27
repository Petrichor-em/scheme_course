(define reverse!
	(lambda (l)
		(let loop ((l l) (r `()))
			(if (null? l)
				r
				(loop (cdr l) (cons (car l) r))))))
(define (print-list lst)
	(if (null? lst)
		`end
		(begin
			(display (car lst))
			(print-list (cdr lst)))))
(define lst (string->list "HelloWorld!"))
(define reversed-list (reverse! lst))
(print-list reversed-list)
(newline)