;; normalize the sign so that if the rational number is positive, 
 ; both the numerator and denominator are positive, 
 ; and if the rational number is negative, 
 ; only the numerator is neg- ative.
(define (make_rat n d)
  ; if d is negative, flip n to -n and d to positve
  (let ((g (gcd n d))
        (signed_n (if (negative? d) (- 0 n) n))
        (signed_d (abs d)))
    (cons (/ signed_n g) (/ signed_d g))))