(define (smooth f fold)
  (define (smooth_once)
    (let ((dx 0.00001))
      (lambda (x) (/ (+ (f (- x dx) (f x) (f (+ x dx))))))))
  (repeated smooth_once fold))
  