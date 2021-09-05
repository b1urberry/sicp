;; How many different ways can we make change of $1.00, 
 ; given half-dollars, quarters, dimes, nickels, and pennies?
 ; input amount in cents
(define (count_change amount)
  (define (rec amount kinds_of_coins)
    (cond ((= amount 0) 1) ;count as 1 way when the amount is subtracted to 0
          ((< amount 0) 0) ;count as 0 way when amount<0 after a subtraction
          ((= kinds_of_coins 0) 0) ;count as 0 way when we run out of coins and amount>0
          (else (+ ;the total number of ways is the sum of
                   ;the number of ways using a kind of coin
                   (rec (- amount (denomination kinds_of_coins)) kinds_of_coins)
                   ;the number of ways not using any of this kind of coin
                   (rec amount (- kinds_of_coins 1))))))
  (rec amount 5))

;; the amount to of cents to subtract when using a kind of coin 
(define (denomination kinds_of_coins)
  (cond ((= kinds_of_coins 1) 1) ;cent
        ((= kinds_of_coins 2) 5) ;nickel
        ((= kinds_of_coins 3) 10) ;dime
        ((= kinds_of_coins 4) 25) ;quarter
        ((= kinds_of_coins 5) 50))) ;half dollar