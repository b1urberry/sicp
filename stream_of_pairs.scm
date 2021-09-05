(load "stream_helper.scm")

;;construct a stream of pairs
 ;each pair (a b), a being element of stream s, b being element of stream t
 ;(a b) and (b a) are considered same, so only (a b) included
(define (pairs s t)
  (cons-stream
  	;;1st pair, 1st part: (fist-of-s first-of-t) 
  	(list (stream-car s) (stream-car t))
  	;;joined stream of 2nd and 3rd part
  	(interleave 
  		;;2nd part: stream of pairs (s0 t1,t2,t3,t4....)
  		(stream-map (lambda (x) (list (stream-car s) x))
  								(stream-cdr t))
  		;;3rd part
  		(pairs (stream-cdr s) (stream-cdr t)))))

;;alternatively puts elements of s1 and s2 into the returned stream
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
      						 (interleave s2 (stream-cdr s1)))))