(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append (list) (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      (list)
      (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

(define empty-board (list))

(define (tail lst)
	(car (reverse lst)))

(define (remove-tail lst)
	(reverse (cdr (reverse lst))))

(define (safe? k positions)
  (let ((new-row (tail positions)))
    (define (safe-helper col rest-of-queens)
		 (if (null? rest-of-queens)
			#t
			(let ((row (car rest-of-queens)))
				(if (or (= row new-row)
						    (= (- row col)
                   (- new-row k))
						    (= (+ row col)
                   (+ new-row k)))
					  #f
					  (safe-helper (+ col 1) (cdr rest-of-queens))))))
	(safe-helper 1 (remove-tail positions))))

(display (queens 6))
(newline)
