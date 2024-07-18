(define (reverse x)
	(define (helper result lst)
		(if (null? lst)
			result
			(helper (cons (car lst) result) (cdr lst))))
	(helper (list ) x))

(define one-through-five (list 1 2 3 4 5))

(display (reverse one-through-five))
(newline)

(define (deep-reverse x)
	(define (helper result lst)
		(cond 	((null? lst)	result)
				((not (pair? (car lst)))	(helper (cons (car lst) result) (cdr lst)))
				(else	(helper (cons (helper (list ) (car lst)) result) (cdr lst)))))
	(helper (list ) x))

(define x (list (list 1 2) (list 3 4)))

(display (reverse x))
(newline)
(display (deep-reverse x))
(newline)