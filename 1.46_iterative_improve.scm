;; iteratively improves guess using the "improve" procedure until it satisfies "good_enough?"
(define (iterative_improve good_enough? improve)
  (define (iter guess)
    (let ((next_guess (improve guess)))
      (if (good_enough? guess next_guess)
        next_guess
        (iter next_guess))))
  ; returns a procedure that takes the argument guess
  (lambda (guess) (iter guess)))

(define (square_root x guess)
  ((iterative_improve (lambda (guess next_guess) (< (abs (- guess next_guess)) 0.00001))
                      (lambda (y) (/ (+ y (/ x y)) 2)))
   guess))

(define (fixed_point f first_guess)
  ((iterative_improve (lambda (guess next_guess) (< (abs (- guess next_guess)) 0.00001))
                      f)
   first_guess))