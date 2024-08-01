(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
      (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

; (copy-to-list tree result-list) = (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result-list)))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= (entry set) x) #t)
		((> (entry set) x) (element-of-set? x (left-branch set)))
		((< (entry set) x) (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
		((= (entry set) x) set)
		((> (entry set) x)
         (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
        ((< (entry set) x)
         (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))

(define (list->tree list)
  (define (iter tree lst)
    (if (null? lst)
      tree
      (iter (adjoin-set (car lst) tree) (cdr lst))))
  (iter '() list))

(define tree (list->tree (list 3 5 4 6 0 2 7 8 3 2 23 45 23 10 39)))

(define (print-tree tree)
  (if (null? tree)
      'search-end
      (begin
        (display (entry tree))
        (newline)
        (print-tree (left-branch tree))
        (print-tree (right-branch tree)))))

; (print-tree tree)

(define list-1 (tree->list-1 tree))
(define list-2 (tree->list-2 tree))
(display list-1)
(newline)
(display list-2)
(newline)
