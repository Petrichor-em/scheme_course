(define add2
	(lambda (x) (+ x 2)) )

(display (add2 2))
(newline)
(define clearVector
  (lambda (vec)
    (begin
      (vector-set! vec 0 0)
      (vector-set! vec 1 0)
      (vector-set! vec 2 0)
    )
  )
)

(define vec1 (vector 1 2 3 4 5))
(display vec1)
(newline)
(clearVector vec1)
(display vec1)
(newline)