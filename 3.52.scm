(load "stream_helper.scm")

(define sum 0)
(define (accum x) 
	(set! sum (+ x sum)) 
	sum)
(define seq
	(stream-map accum
							(stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z
	(stream-filter (lambda (x) (= (remainder x 5) 0))
								 seq))
(stream-ref y 7)
(display-stream z)




;;evaluating
(define seq
	(stream-map accum
							(stream-enumerate-interval 1 20)))
;;returns the following pair which is bound to "seq"; updates "sum" to 1
(1 (delay (stream-map accum (stream-enumerate-interval 2 20))))


;;evaluating
(define y (stream-filter even? seq))
;;since 1 is odd, "stream-filter" executes the else expression, which is
(stream-filter even? (stream-cdr seq))
;;which is
(stream-filter even? (stream-map accum (stream-enumerate-interval 2 20)))
;;evaluating the "stream-map" gives
(stream-filter even? ((+ sum 2) (delay (stream-map accum (stream-enumerate-interval 3 20)))))
;;updates "sum" to 3
;;since 3 is odd, "stream-filter" executes the else expression, which is
(stream-filter even? (stream-cdr (3 (delay (stream-map accum (stream-enumerate-interval 3 20))))))
;;which is 
(stream-filter even? (stream-map accum (stream-enumerate-interval 3 20)))
;;evaluating the "stream-map" gives
(stream-filter even? ((+ sum 3) (delay (stream-map accum (stream-enumerate-interval 4 20)))))
;;updates "sum" to 6
;;since 6 is even, "stream-filter" executes the concequence expression, which is
(cons-stream 6
						 (stream-filter even? 
						 								(stream-map accum (stream-enumerate-interval 4 20))))
;;bounds the following pair to y
(6 
 (delay (stream-filter even? 
 											 (stream-map accum 
 											 						 (stream-enumerate-interval 4 20)))))


;;evaluating
(define z
	(stream-filter (lambda (x) (= (remainder x 5) 0))
								 seq))
;;proceeds the "seq" in a similar manner as y
 ;bounds the following pair to z, updating "sum" to 10
(10 
 (stream-filter (lambda (x) (= (remainder x 5) 0))
								(stream-map accum (stream-enumerate-interval 5 20))))


;;evaluating
(stream-ref y 7)
;;forces "seq" to proceed to the 16th
 ;updating "sum" to 136
 ;returning 136

;;evaluating
(display-stream z)
 ;forces the "seq" to the end, updating "sum" to 210
 ;displays 10 15 45 55 105 120 190 210


;;if we didn't use "memo-proc"
(stream-map accum interval)
;;will be repeatedly evaluated for values already computed,
 ;while also updating sum in the repeated process, leading to different results



 










