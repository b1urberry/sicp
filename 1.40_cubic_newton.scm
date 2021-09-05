(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (solve_cubic a b c)
  (newtons_method (cubic a b c) 1))