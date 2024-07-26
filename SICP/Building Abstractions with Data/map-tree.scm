(define (scale-tree tree factor)
	(cond 	((null? tree) (list ))
			((not (pair? tree)) (* tree factor))
			(else (cons (scale-tree (car tree) factor) (scale-tree (cdr tree) factor)))))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display tree)
(newline)

(display (scale-tree tree 2))
(newline)

(define (scale-tree-2 tree factor)
	(define (scale sub-tree)
		(if (pair? sub-tree)
			(scale-tree-2 sub-tree factor)
			(* factor sub-tree)))
	(map scale tree))

(display (scale-tree-2 tree 2))
(newline)