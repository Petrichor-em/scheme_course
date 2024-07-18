(define (my-append lst1 lst2)
	(if (null? lst1)
		lst2
		(cons (car lst1) (my-append (cdr lst1) lst2))))

(define (fringe x)
	(cond 	((null? x)	(list ))
			((not (pair? (car x)))	(cons (car x) (fringe (cdr x))))
			(else	(append (fringe (car x)) (fringe (cdr x))))))

(define x (list (list 1 2) (list 3 4)))

(display (fringe x))
(newline)

(display (fringe (list x x)))
(newline)

(define y (list 1 2 (list 3 4 (list 5 6)) 7 8 (list 9 10)))

(display (fringe y))
(newline)