(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter initial sequence))

(define (fold-right op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (fold-right op initial (cdr sequence)))))

(display (fold-right / 1 (list 1 2 3))) ;3/2
(newline)
(display (fold-left / 1 (list 1 2 3))) ;3
(newline)
(display (fold-right list (list ) (list 1 2 3)))
(newline)
(display (fold-left list (list ) (list 1 2 3)))
(newline)

;What **nature** does #op have such that #fold-right has the same effect with #fold-left?
;It must satisfy:
	;1. associative law
	;2. commutative law

;(define (reverse sequence)
;	(fold-right (lambda (x y) (append y (list x))) (list ) sequence))

(define (reverse sequence)
	(fold-left (lambda (x y) (cons y x)) (list ) sequence))

(define seq (list 1 2 3 4))
(display (reverse seq))
(newline)