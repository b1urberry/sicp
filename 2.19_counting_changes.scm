
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount kinds_of_coins)
  (define (rec amount l)
    (cond ((= 0 amount) 1)
          ((> 0 amount) 0)
          ((null? l) 0) ; 0 way when the list of coins is empty
          (else (+ 
                   ; when the first coin is used, subtract amount with first elemtent of coin list
                   (rec (- amount (car l)) l) 
                   ; when not using first coin, remove first element with coin list
                   (rec amount (cdr l)))))) 
  (rec amount kinds_of_coins))