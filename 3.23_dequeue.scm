(define (front-ptr dequeue) (car dequeue))
(define (rear-ptr dequeue) (cdr dequeue))
(define (set-front-ptr! dequeue item) (set-car! dequeue item))
(define (set-rear-ptr! dequeue item) (set-cdr! dequeue item))

(define (make-element this prev) (cons this prev))
(define (this element) (car element))
(define (previous element) (cdr element))
(define (set-this! element value) (set-car! element value))
(define (set-pev! element value) (set-cdr! element value))


(define (make-dequeue) (cons '() '())
(define (empty-dequeue? dequeue) (null? (front-ptr dequeue)))

(define (front-dequeue dequeue)
  (if (empty-dequeue? dequeue)
      (error "FRONT called on empty dequeue" dequeue)
      (car (front-ptr dequeue))))

(define (rear-dequeue dequeue)
  (if (empty-dequeue? dequeue)
      (error "REAR called on empty dequeue" dequeue)
      (car (rear-ptr dequeue))))

(define (front-insert-dequeue! dequeue item)
	(let ((element (make-element item '())))
		(cond ((empty-dequeue? dequeue) 
						(set-front-ptr! dequeue element)
						(set-rear-ptr! dequeue element)
						dequeue)
		      (else
		       	(set-pev! (front-dequeue dequeue) element)
		       	(set-front-ptr! dequeue (cons element (front-ptr dequeue)))
		       	dequeue))))

(define (rear-insert-dequeue! dequeue item)
  (let ((element (make-element item '())))
  	(let ((new-pair (cons element '())))
  		(cond ((empty-dequeue? dequeue) 
  						(set-front-ptr! dequeue new-pair)
  						(set-rear-ptr! dequeue new-pair)
  						dequeue)
  		      (else 
  		      	(set-pev! element (rear-dequeue dequeue))
  		      	(set-cdr! (rear-ptr dequeue) new-pair)
  		      	(set-rear-ptr! dequeue new-pair)
  		      	dequeue)))))

(define (front-delete-dequeue! dequeue)
  (cond ((empty-dequeue? dequeue) (error "DELETE! called with an empty dequeue" dequeue))
        (else 
        	(set-front-ptr! dequeue (cdr (front-ptr dequeue)))
        	(set-pev! (front-dequeue dequeue) '())
        	dequeue)))

(define (rear-delete-dequeue! dequeue)
  (cond ((empty-dequeue? dequeue) (error "DELETE! called with an empty dequeue" dequeue))
        (else 
        	(set-rear-ptr! dequeue (prev (rear-dequeue dequeue))))))



