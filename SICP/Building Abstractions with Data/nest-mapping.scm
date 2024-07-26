(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
	(if (> low high)
		(list )
		(cons low (enumerate-interval (+ low 1) high))))


(define (pairs n)
	(define (gen-pairs n)
		(map	(lambda (i)
					(map	(lambda (j) (list i j))
							(enumerate-interval 1  (- i 1))))
				(enumerate-interval 1 n)))
	(accumulate append (list ) (gen-pairs n)))

(define (flatmap proc seq)
	(accumulate append (list ) (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (prime? x)
	(define (iter x divisor)
		(cond 	((= divisor 1) #t)
				((= (remainder x divisor) 0) #f)
				(else (iter x (- divisor 1)))))
	(iter x (- x 1)))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (filter predicate sequence)
	(if (null? sequence)
		(list )
		(let ((address (car sequence)))
			(if (predicate address)
				(cons address (filter predicate (cdr sequence)))
				(filter predicate (cdr sequence))))))

(define (pair-sum-pairs n)
	(map make-pair-sum 
		 (filter prime-sum?
		 		 (flatmap (lambda (i)
				 			(map (lambda (j)
									(list i j))
								 (enumerate-interval 1 (- i 1))))
				 		  (make-interval 1 n)))))

;(display (pair-sum-pairs 10))
;(newline)

(define (permutations s)
	(if (null? s)
		(list (list ))
		(flatmap (lambda (x)
					(map (lambda (p) (cons x p))
						 (permutations (remove x s))))
				 s)))

(define (remove item sequence)
	(filter (lambda (x) (not (= x item))) sequence))

;(define set (list 1 2 3 4))
;(display (permutations set))
;(newline)

(define (sum-equal-s? triplet s)
	(= (accumulate + 0 triplet)
	   s))

(define (gen-triplet n)
	(flatmap (lambda (i)
				(flatmap (lambda (j)
						(map (lambda (k) (list i j k))
							 (enumerate-interval 1 n)))
					 (enumerate-interval 1 n)))
			 (enumerate-interval 1 n)))

(define (make-specific-triplet n s)
	(filter (lambda (tri) (sum-equal-s? tri s)) (gen-triplet n)))

;(display (make-specific-triplet 5 10))
;(newline)