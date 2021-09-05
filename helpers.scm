;;takes a frame as argument,
 ;returns a procedure which takes a vector(in terms of the given frame) as argument
 ;and returns the vector in terms of the coordinates
(define (frame-coord-map frame) 
  (lambda (v)
    (add-vect 
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame)) 
                (scale-vect (ycor-vect v) (edge2-frame frame))))))

;;generate a sequence of numbers from a inteveral
(define (enumerate_interval low high)
  (define (iter result count)
    (if (> count high)
        result
        (iter (cons count result) (+ count 1))))
  (iter () low))

;;
(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

;;accumulate a sequence of elements using a certain operation
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;applies the designated accumulation procedure to combine all the first elements of the sequences, 
 ;all the second elements of the sequences, and so on, and returns a sequence of the results
(define (accumulate_n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate_n op init (map cdr seqs)))))


;; sum while applying "term" to the numbers
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter term a next b 0)) 


;; find the fixed point of f(x) where x = f(x)
(define (fixed_point f first_guess)
  ; a and b are considered equal when their difference is smaller than tolerance
  (define (close_enough? a b) 
    (< (abs (- a b)) 0.00001))
  (define (try guess)
    (newline) (display guess) ; prints each approximation
    (let ((next_guess (f guess)))
      ; if x and f(x) are close enough, then the fixed point is found
      (if (close_enough? guess next_guess)
        next_guess
        (try next_guess))))
  (try first_guess))


(define (newton_transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

;; newton's method: takes as arguments a procedure that computes the function 
 ; for which we want to find a zero, together with an initial guess
(define (newtons_method g guess)
  (fixed_point (newton_transform g) guess))

;; derivative of a function. Takes a function as argument and returns a function
(define (deriv g)
  (let ((dx 0.00001)) ; a very small change of x (delta x, or dx)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))

;; apply average damping to f n times
(define (average_damp f n)
  (repeated (lambda (x) (/ (+ x (f x)) 2)) n))

;; continued fraction (for approximating values)
(define (con_frac n d k)
  (define (iter c result)
    (if (= c 0)
      result
      (iter (- c 1) 
            (/ (n c) (+ (d c) result)))))
(iter k 0))

;; primality test (if x has only 1 and itself as its divisor)
(define (prime? x)
  ; test for divisor of n starting from "start"
  (define (find_divisor n start)
    ; if n is not divisible by 2, it's unnessary to test other even numbers
    (define (nxt n)
      (if (= n 2)
        (+ n 1)
        (+ n 2)))
    (cond ((> (square start) n) n) ;If d is a divisor of n, then so is n/d. But d and n/d cannot both be greater than √n
          ((= (remainder n start) 0) start) 
          (else (find_divisor n (+ start 1))))) 

  (= (find_divisor x 2) x))


;; primality test (fermet test)
(define (fast_prime? x)
  ; for any integers x, y, and m, 
  ; we can find the remainder of x times y modulo m by 
  ; computing separately the remainders of x modulo m and y modulo m, 
  ; multiplying these, and then taking the remainder of the result modulo m
  (define (expmod base n m)
    (cond ((= n 0) 1)
          ((even? n) 
            (remainder (square (expmod base (/ n 2) m)) m))
          (else 
            (remainder (* (remainder base m) (expmod base (- n 1) m)) m))))
  
  (define (fermet_test n)
    (define (try a) (= a (expmod a n n)))
    (try (+ 1 (random (- n 1))))) ; try a random number between 1 and n-1

  (fermet_test x))



;; fib(n) (succesive squaring of a transformation)
(define (fib n)
  (define (fib_trans_iter a b p q count)
    (cond ((= 0 count) b)
          ((even? count) 
            (fib_trans_iter a
                            b
                            (+ (square p) (square q))
                            (+ (square q) (* 2 p q))
                            (/ count 2)))
          (else (fib_trans_iter (+ (* b p) (* a q) (* a p))
                                (+ (* b p) (* a q))
                                p
                                q
                                (- count 1)))))
  (fib_trans_iter 1 0 0 1 n))

;; the composition f after g is defined to be the function f(g(x))
(define (compose f g) (lambda (x) (f (g x))))

;; repeatedly apply f n times
(define (repeat f n)
  (define (iter count result_f)
    (if (= count 1)
      result
      (iter (- count 1) (compose f result_f))))
  (iter n f))