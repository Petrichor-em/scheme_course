(define x (cons 1 #t))
(display x)
(newline)
(display (car x))
(newline)
(display (cdr x))
(newline)
(set-car! x 2)
(set-cdr! x "Hello World!")
(display x)
(newline)
(define y (cons 4 x))
(display (car y))
(newline)
(display (cdr (cdr y)))
(newline)
(display y)
(newline)
(display (cddr y))
(newline)