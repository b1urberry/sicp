(define (make-semaphore-mutex n)
  (define (make-mutex-list)
    (define (iter l c)
      (if (= c n)
          l
          (iter (cons l (make-mutex)) (+ c 1))))
  	(iter (list '()) 0))
	(define (the-semaphore request)
	  ))

(define (make-mutex)
  (let ((cell (list false)))
  	(define (the-mutex request)
  	  (cond ((eq? request 'aquire) 
  	  			 (if (test-and-set! cell)
								 (the-mutex 'aquire)))
  	        ((eq? request 'releae) (clear! cell))))
  	the-mutex))

(define (clear! cell) (set-car! cell false))
(define (test-and-set! cell)
  (without-interrupts
  	(lambda () 
  		(if (car cell)
      		true
      		(begin (set-car! cell true)
      			 		 false)))))