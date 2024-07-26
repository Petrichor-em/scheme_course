(define (square x) (* x x))

(define (square-tree tree)
	(cond 	((null? tree) (list ))
			((not (pair? tree)) (square tree))
			(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define tree (list 1
				   (list 2 (list 3 4) 5)
				   (list 6 7)))
(display tree)
(newline)

(display (square-tree tree))
(newline)

(define (square-tree-2 tree)
	(define (square-sub-tree sub-tree)
		(if (not (pair? sub-tree))
			(square sub-tree)
			(square-tree-2 sub-tree)))
	(map square-sub-tree tree))

(display (square-tree-2 tree))
(newline)

(define (tree-map square tree)
	(define (square-sub-tree sub-tree)
		(if (not (pair? sub-tree))
			(square sub-tree)
			(tree-map square sub-tree)))
	(map square-sub-tree tree))

(define (square-tree-3 tree)
	(tree-map square tree))

(display (square-tree-3 tree))
(newline)