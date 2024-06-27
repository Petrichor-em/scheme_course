(define ch #\c)
(case ch
  ((#\a) (display 1) (newline))
  ((#\b) (display 2) (newline))
  ((#\c) (display 3) (newline))
  (else (display "Character not recognized"))
)
