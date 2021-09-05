;;takes a list as argument and returns a list of the same elements in reverse order
(define (reverse_list l)
  (define (iter l result)
    (if (null? l)
      result
      (iter (cdr l) (cons (car l) result))))
  (iter l ()))