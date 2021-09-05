(define (square_list l)
  (if (null? l)
    ()
    (cons (square (car l))
          (square_list (cdr l)))))

(define (square_list_map l)
  (map square l))

