(define x (cons (list 1 2) (list 3 4)))

(define (length lst)
	(if (null? lst)
		0
		(+ 1 (length (cdr lst)))))

(display (length x))
(newline)

(define (count-leaves tree)
	(define counter 0)
	(define (iter node)
		(if (not (list? node))
			(set! counter (+ counter 1))
			(count-each node)))
	(define (count-each lst)
		(map iter lst))
	(iter tree)
	counter)

(define (count-leaves-2 tree)
	(cond 	((null? tree)		0)
			((not (pair? tree))	1)
			(else				(+	(count-leaves-2 (car tree))
									(count-leaves-2 (cdr tree))))))

(display (count-leaves x))
(newline)
(display (count-leaves (list x x)))
(newline)

(display (count-leaves-2 x))
(newline)
(display (count-leaves-2 (list x x)))
(newline)

(define some-tree (list 1 (list 2 (list 3 4))))
(display some-tree)
(newline)

(define some-tree-2 (list 1 3 (list 5 7) 9))
(define value-2 (car (cdr (car (cdr (cdr some-tree-2))))))
(display value-2)
(newline)

(define some-tree-3 (list (list 7)))
(define value-3 (caar some-tree-3))
(display value-3)
(newline)

(define some-tree-4 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define (get-7 lst)
	(if (not (pair? lst))
		lst
		(get-7 (cadr lst))))
(display (get-7 some-tree-4))
(newline)