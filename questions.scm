;;1.04 
;;our model of evaluation allows for combinations whose OPERATORS are compound expressions.
(define (a_plus_abs_b a b)
  ((if (> b 0) + -) a b))

;;1.05 
;;test for applicative-order or normal-order evaluation, 
 ;assuming the evaluation of "if" is the same in both cases (predicate gets evaluated first, then "short circuit")
(define (p) (p))
(define (test x y)
  (if (= 0 x) 0 y))
  ;(test 0 (p)) ;gives infinite loop in applicative-order, 0 in normal-order
  ;(test 0 p)
  ; note the difference between p and (p)
  ; evaluating p gives the operation (p), not calling the funcion p

;;1.06 
;;difference between "if" and "cond"
(define (new-if predicate then-clause else-clause) 
  (cond (predicate then-clause)
        (else else-clause)))


;;1.41 
;;double takes a pro- cedure of one argument as argument 
 ;and returns a proce- dure that applies the original procedure twice
(define (double f)
  (lambda (x) (f (f x))))
 ; what happens with this?
(((double (double double)) inc) 5)

;;2.24 
;;Suppose we evaluate the expression 
 ;(list 1 (list 2 (list 3 4))). 
 ;Give the result printed by the interpreter, the corresponding box-and-pointer structure, 
 ;and the interpretation of this as a tree


;;2.25
;;Give combinations of cars and cdrs that will pick 7 from each of the following lists
 ;(1 3 (5 7) 9)
 ;((7))
 ;(1 (2 (3 (4 (5 (6 7))))))

 