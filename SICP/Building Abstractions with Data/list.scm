(define (list-ref items n)
	(if (= n 0)
		(car items)
		(list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))
(define odd (list 1 3 5 7 9))

; Recursion
(define (length-1 items)
	(if (null? items)
		0
		(+ 1 (length (cdr items)))))

; Iteration
(define (length-2 items)
	(define (iter a count)
		(if (null? a)
			count
			(iter (cdr a) (+ count 1))))
	(iter items 0))

(define (append list1 list2)
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))))

(define (last-pair list)
	(if (null? (cdr list))
		list
		(last-pair (cdr list))))

(define (reverse list)
	(define (helper ret-lst lst)
		(if (null? lst)
			ret-lst	
			(helper (cons (car lst) ret-lst) (cdr lst))))
	(helper '() list))

;(display (reverse odd))
;(newline)

;(display (last-pair odd))
;(newline)

;(define appended-list (append squares odd))
;(display appended-list)
;(newline)

;(display (length-2 squares))
;(newline)

;(display (list-ref squares 0))
;(newline)
;(display (list-ref squares 1))
;(newline)
;(display (list-ref squares 2))
;(newline)