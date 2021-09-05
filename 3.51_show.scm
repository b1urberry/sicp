(load "stream_helper.scm")

(define x
	(stream-map show
							(stream-enumerate-interval 0 10)))
;;shows "0"

;;stream-map translates to
(cons-stream (show (stream-car s))
						 (stream-map show (stream-cdr s)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(stream-enumerate-interval 0 10) 
;;returns a pair
(0
 (delay (stream-enumerate-interval 1 10)))

;;thus,
(stream-map show
						(stream-enumerate-interval 0 10))
;;translates to
(stream-map show
						(0
						 (delay (stream-enumerate-interval 1 10))))
;;which is
(cons-stream (show 0)
						 (stream-map show
						 						 (force (delay (stream-enumerate-interval 1 10)))))
;;which is
(cons-stream (show 0)
						 (stream-map show
						 						 (stream-enumerate-interval 1 10)))
;;showing "0" and delaying the execution of the next "stream-map"
;;"x" is now a pair
(0
 (delay (stream-map show
										(stream-enumerate-interval 1 10))))


(stream-ref x 5)
;;shows
 ;1
 ;2
 ;3
 ;4
 ;4

(stream-ref x 5)
;;translates to
(stream-ref (stream-cdr x)
						(- 5 1))
;;which is 
(stream-ref (stream-map show (stream-enumerate-interval 1 10))
						4)
;;evaluating 
(stream-map show (stream-enumerate-interval 1 10))
;;displays "1" and returns
(1
 (delay (stream-map show
 										(stream-enumerate-interval 2 10))))
;;thus, (stream-ref x 5) ultimately translates to
(stream-ref (1 (delay (stream-map show (stream-enumerate-interval 2 10))))
						4)
;;which then translates to
(stream-ref (stream-cdr (1 (delay (stream-map show (stream-enumerate-interval 2 10)))))
						(- 4 1))
;;which is
(stream-ref (stream-map show (stream-enumerate-interval 2 10))
						3)
;;displaying 2 and propegates to
(stream-ref (stream-map show (stream-enumerate-interval 3 10))
						2)


;;definition of stream-ref:
(define (stream-ref s n)
  (cond ((steram-null? s) false)
        ((= n 0) (stream-car s))
      	(else (stream-ref (stream-cdr s)
      										(- n 1)))))

(stream-ref x 5)
;;triggers the "else" in the "cond", and translates to
(stream-ref (stream-cdr x)
						(- 5 1))
;;which is



(stream-ref x 7)
;;shows
 ;1
 ;2
 ;3
 ;4





(define (display-line x)
  (display x)
	(newline))

(define (show x)
  (display-line x)
	x)














