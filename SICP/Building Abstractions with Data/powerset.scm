(define (append-element elem s)
	(map (lambda (x) (cons elem x)) s))

(define (powerset s)
	(if (null? s)
		(list (list ))
		(append (powerset (cdr s)) (append-element (car s) (powerset (cdr s))))))

(define set (list 1 2 3 4))
(display (powerset set))
(newline)