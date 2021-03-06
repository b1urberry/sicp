(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
      				(encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (display tree)
  (newline)
  (let ((left (left-branch tree))
        (right (right-branch tree)))
    (cond ((and (leaf? left) (eq? (symbol-leaf left) symbol)) (list 0))
          ((element-of-set? symbol (symbols left)) (append (list 0) (encode-symbol symbol left)))
          ((and (leaf? right) (eq? (symbol-leaf right) symbol)) (list 1))
          (else (append (list 1) (encode-symbol symbol right))))))