;; apply average damping to f n times
(define (average_damp f n)
  ; find repeated in "helpers.scm"
  (repeated (lambda (x) (/ (+ x (f x)) 2)) n))