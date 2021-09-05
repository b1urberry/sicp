(define (make_point x y) (cons x y))
(define (x_coord point) (car point))
(define (y_coord point) (cdr point))

(define (make_segment a b) (cons a b))
(define (start_segment segment) (car segment))
(define (end_segment segment) (cdr segment))

(define (midpoint segment)
  (let ((start (start_segment segment))
        (end (end_segment segment)))
    (let ((x (/ (+ (x_coord start) (x_coord end)) 2))
          (y (/ (+ (y_coord start) (y_coord end)) 2)))
      (make_point x y))))

(define (print_point p) 
  (newline)
  (display "(") 
  (display (x_coord p)) 
  (display ",")
  (display (y_coord p)) 
  (display ")"))

