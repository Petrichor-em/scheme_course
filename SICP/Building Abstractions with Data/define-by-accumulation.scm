(define one-seven (list 1 2 3 4 5 6 7))
(define one-five (list 1 2 3 4 5))
(define tree (list 1 (list 2 (list 3 4)) 5))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (map proc sequence)
	(accumulate (lambda (x y) (cons (proc x) y))
				(list )
				sequence))

(define (square x) (* x x))

(define (append seq1 seq2)
	(accumulate cons
				seq2
				seq1))

(define (length sequence)
	(accumulate (lambda (x y) (+ 1 y))
				0
				sequence))

(define (horner-eval x coefficient-sequence)
	(accumulate (lambda (this-coeff higer-terms) (+ (* higer-terms x)
													this-coeff))
				0
				coefficient-sequence))

;(display (horner-eval 2 (list 1 3 0 5 0 1)))

;How can I define #count-leaves program using #accumulate?
(define (count-leaves t)
	(accumulate (lambda (x y) (+ x y))
				0
				(map count-sub-leaves t)))

;Convert a tree into a leaves-sequence.
(define (fringe tree)
	(cond 	((null? tree) (list ))
			((not (pair? tree)) (list tree))
			(else (append (fringe (car tree)) (fringe (cdr tree))))))

(define (count-sub-leaves sub-tree)
	(length (fringe sub-tree)))

;(display (count-leaves tree))
;(newline)

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		(list )
		(cons (accumulate op init (map car seqs))
			  (accumulate-n op init (map cdr seqs)))))

(define seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

;(display (accumulate-n + 0 seqs))
;(newline)