(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 50 100 20 10 5 2 1 0.5))

(define (cc amount coin-values)
	(cond ((= amount 0) 1)
		  ((or (< amount 0) (no-more? coin-values)) 0)
		  (else (+ (cc amount (except-first-nomination coin-values))
		  		   (cc (- amount
				    	  (first-nomination coin-values))
					   coin-values)))))

(define (first-nomination coin-values)
	(car coin-values))

(define (except-first-nomination coin-values)
	(cdr coin-values))

(define (no-more? coin-values)
	(null? coin-values))

(display (cc 100 us-coins))
(newline)