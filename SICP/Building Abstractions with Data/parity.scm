(define (reverse list)
	(define (helper ret-lst lst)
		(if (null? lst)
			ret-lst	
			(helper (cons (car lst) ret-lst) (cdr lst))))
	(helper '() list))

(define (same-parity? a b)
	(or (and (odd? a) (odd? b)) (and (even? a) (even? b))))

(define (same-parity p . left)
	(let ((lst (cons p left)))
		(define (helper result now-lst)
			(if (null? now-lst)
				result
				(if (same-parity? p (car now-lst))
					(helper (cons (car now-lst) result) (cdr now-lst))
					(helper result (cdr now-lst)))))
		(reverse (helper '() lst))))

(define (same-parity-2 . lst)
	(let ((p (car lst)))
		(define (helper help-lst)
			(cond ((null? help-lst)					'())
				  ((same-parity? p (car help-lst))	(cons (car help-lst) (helper (cdr help-lst))))
				  (else								(helper (cdr help-lst)))))
		(helper lst)))

(display (same-parity-2 1 2 3 4 5 6 7))
(newline)
(display (same-parity-2 2 3 4 5 6 7 8))
(newline)