;;returns the list that contains only the last element of a given (nonempty) list
(define (last_pair l)
  (if (null? (cdr l))
    l
    (last_pair (cdr l))))