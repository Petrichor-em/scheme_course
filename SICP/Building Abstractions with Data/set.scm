(define (equal? a b)
	(cond ((and (null? a)
	            (null? b) #t))
	      ((and (number? a)
				(number? b)) (= a b))
		  ((and (symbol? a)
		  		(symbol? b)) (eq? a b))
          ((and (list? a)
		        (list? b)) (and (equal? (car a) (car b))
				                (equal? (cdr a) (cdr b))))
		  (else #f)))


(define (element-of-set? x set)
	(cond ((null? set) #f)
		  ((equal? x (car set)) #t)
		  (else (element-of-set? x (cdr set))))) 

(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cons x set)))

(define (intersection-set set1 set2)
	(cond ((or (null? set1) (null? set2)) (list))
		  ((element-of-set? (car set1) set2)
		  		(cons (car set1) (intersection-set (cdr set1) set2)))
		  (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
	(cond ((null? set1) set2)
		  ((null? set2) set1)
		  ((not (element-of-set? (car set1) set2))
		  		(cons (car set1) (union-set (cdr set1) set2)))
		  (else (union-set (cdr set1) set2))))

(define set1 `(a b c d 1 2 3 4))
(define set2 `(a b c 2 3 4 5))

(display (union-set set1 set2))
(newline)
(display (intersection-set set1 set2))
(newline)