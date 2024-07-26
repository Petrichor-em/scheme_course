(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cadr mobile))

(define (branch-length branch)
	(car branch))

(define (branch-structure branch)
	(cadr branch))

(define (total-weight mobile)
	(+	(branch-weight (left-branch mobile))
		(branch-weight (right-branch mobile))))

(define (branch-weight branch)
	(if (not (list? (branch-structure branch)))
		(branch-structure branch)
		(total-weight (branch-structure branch))))

(define mobile-a (make-mobile (make-branch 1 1) (make-branch 2 2)))
(define mobile-b (make-mobile (make-branch 3 3) (make-branch 2 4)))

(define mobile-c (make-mobile	(make-branch 2 mobile-a)
								(make-branch 3 (make-mobile	(make-branch 1 5)
															(make-branch 1 mobile-b)))))

(define (mobile-balanced? mobile)
	(let ((left-length (branch-length (left-branch mobile)))
		  (right-length (branch-length (right-branch mobile)))
		  (left-weight (branch-weight (left-branch mobile)))
		  (right-weight (branch-weight (right-branch mobile))))
		  	(=	(* left-length left-weight)
				(* right-length right-weight))))

(define weight-mobile-a (total-weight mobile-a))
(display weight-mobile-a)
(newline)
(define weight-mobile-b (total-weight mobile-b))
(display weight-mobile-b)
(newline)
(define weight-mobile-c (total-weight mobile-c))
(display weight-mobile-c)
(newline)

(display (mobile-balanced? mobile-c))
(newline)