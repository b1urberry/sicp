(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream (apply proc 
      										(map stream-car 
      										 		 argstreams))
    							 (stream-map proc 
    							 						 (map stream-cdr	 
    							 									argstreams)))))