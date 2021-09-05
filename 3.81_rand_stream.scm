(load "stream_helper.scm")

(define (produce-rand-nums request-stream rand-stream)
  (let ((request (stream-car request-stream)))
  	(cond ((eq? (car request) 'generate)
  					(cons-stream 
  						(stream-car rand-stream)
  	    			(produce-rand-nums (stream-cdr request-stream) 
  	    												 (stream-cdr rand-stream))))
  	      ((eq? (car request) 'reset) 
  	      	(let ((new-rand-stream (random-stream (cadr request))))
  	      		(cons-stream 
  	      			(stream-car new-rand-stream)
  	    				(produce-rand-nums (stream-cdr request-stream)
  	    													 (stream-cdr new-rand-stream)))))
  	    	(else (error "unknown request" request)))))

(define (random-stream init)
  (define random-from
  	(cons-stream init
  							 (stream-map rand-update
  							 						 random-from)))
	random-from)

 (define (rand-update x) 
         (remainder (+ (* 13 x) 5) 24)) 

 (define request-s
 	(list->stream 
 		(list '(generate)
 					'(generate)
 					'(generate)
 					'(reset 52)
 					'(generate)
 					'(reset 31)
 					'(generate)
 					'(generate))))

 






