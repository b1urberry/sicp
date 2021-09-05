;;takes one or more integers and returns a list of all the arguments
 ;that have the same even-odd parity as the head argument
(define (same_parity head . tail)
  ;;"same_parity?" is "even?" if head is even and "odd?" otherwise
  (define same_parity? (if (even? head) even? odd?))
  (define (rec l)
    (cond ((null? l) ())
          ;;if the element has the same parity as "head", then add it to the list to return
          ((same_parity? (car l)) (cons (car l) (rec (cdr l))))
          (else (rec (cdr l)))))
  (cons head (rec tail)))

  ;;the same procedure defined with built in function filter
  (define (same_parity_filter head . tail)
    (cons head 
          (filter (if (even? head) even? odd?)
                  tail))) 

  ;;implement filter
  (define (filter_list predicate? items)
    (define (rec l)
      (if (predicate? (car l))
          (cons (car l) (rec (cdr l)))
          (rec (cdr l)))))