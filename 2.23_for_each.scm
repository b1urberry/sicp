(define (for_each f items)
  (define (iter l)
    (if (not (null? l)) (f (car l)))
    (if (null? l)
      true
      (iter (cdr l))))
  (iter items))