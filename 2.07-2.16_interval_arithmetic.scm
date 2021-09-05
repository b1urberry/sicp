

;; 2.7 define the selectors
(define (make_interval a b) (cons a b))
(define (lower_bound interval) (car interval))
(define (upper_bound interval) (cdr interval))

;; 2.8 subtracting intervals
(define (sub_interval x y)
  (make_interval (- (lower_bound x) (upper_bound y))
                 (- (upper_bound x) (lower_bound y))))

;; 2.9 
 ; for interval addition and subtraction,
 ; the width of the combinition is the sum of the width of the argument intervals
 ; whereas it's unsure for multiplication and division

;; 2.10 test for dividing intervals that span zero
(define (div_interval x y)
  )
  