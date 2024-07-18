(define (scale-list items factor)
	(if (null? items)
		(list )
		(cons (* factor (car items)) (scale-list (cdr items) factor))))

(display (scale-list (list 1 2 3 4 5) 5))
(newline)

(define (my-map proc items)
	(if (null? items)
		(list )
		(cons (proc (car items)) (my-map proc (cdr items)))))

(display (my-map abs (list -1 -2 -3 -4 -5)))
(newline)

(define (scale-list-2 items factor)
	(map (lambda (x) (* x factor)) items))

(display (scale-list (list 1 2 3 4 5) 5))
(newline)

(define (square-list items)
	(map (lambda (x) (* x x)) items))

(display (square-list (list 1 2 3 4 5)))
(newline)

(define (square x)
	(* x x))

(define nil (list ))

(define (my-square-list items)
	(if (null? items)
	 	nil
		(cons (square (car items)) (my-square-list (cdr items)))))

(display (my-square-list (list 1 2 3 4 5)))
(newline)

(define (square-list-2 items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (cons answer (square (car things))))))
	(iter items nil))

(define one-through-five (list 1 2 3 4 5))

(display (square-list-2 one-through-five))
(newline)

(define (my-for-each proc items)
	(if (null? items)
		#t
		(begin
			(proc (car items))
			(my-for-each proc (cdr items)))))

(my-for-each (lambda (x) (display x) (newline)) one-through-five)