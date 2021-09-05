(define (make-vect x y) (cons x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
  					 (+ (ycor-vect vect1) (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (add-vect vect1 
  					(scale-vect vect2 (- 0 1))))

(define (scale-vect k vect)
  (make-vect (* (xcor-vect vect) k)
  					 (* (ycor-vect vect) k)))