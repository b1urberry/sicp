(define (make-accumulator init-val)
  (lambda (acc-val) (begin (set! init-val (+ init-val acc-val))
  												 init-val)))