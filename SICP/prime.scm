(define (expmod base exp m)
	(remainder (expt base exp) m))

(define (check a n)
	(= (expmod a n n)
	   (remainder a n)))

(define (is-prime? n)
	(define (check-iter a n)
		(cond 	((not (check a n))	#f)
				((= a n)			#t)
				(else				(check-iter (+ a 1) n))))
	(check-iter 1 n))

(define (display-prime n)
  (define (display-iter i)
    (cond
      ((> i n) 'end)
      ((is-prime? i)
       (begin
         (display i)
         (display " ")
         (display-iter (+ i 1))))
      (else
       (display-iter (+ i 1)))))
  (display-iter 2))
(display-prime 100)
(newline)