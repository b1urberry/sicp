(define (make-table same-key?)

	(define (assoc key records predicate?)
	  (cond ((null? records) false)
	        ((predicate? key (caar records)) (car records))
	      	(else (assoc key (cdr records) predicate?))))

  (let ((local-table (list '*table*)))
  	(define (loopup key1 key2)
  	  (let ((subtable (assoc key1 (cdr local-table) same-key?)))
  	  	(if (subtable)
  	  	    (let ((record (assoc key2 (cdr subtable) same-key?)))
  	  	    	(if (record)
  	  	    	    (cdr record)
  	  	    	    false))
  	  	    false)))

  	(define (insert! key1 key2 value)
  	  (let ((subtable (assoc key1 (cdr local-table) same-key?)))
  	  	(if (subtable)
  	  	    (let ((record (assoc key2 (cdr subtable) same-key?)))
  	  	    	(if (record)
  	  	    	    (set-cdr! record value)
  	  	    	    (set-cdr! subtable 
  	  	    	    					(cons (cons key2 value) 
  	  	    	    								(cdr subtable)))))
  	  	    (set-cdr! local-table
  	  	    					(cons (list key1 (cons key2 value))
  	  	    								(cdr local-table)))))
  		'ok)

  	(define (dispatch m)
  	  (cond ((eq? m 'loopup) loopup)
  	        ((eq? m 'insert!) insert!)
  	      	(else (error "Unknown operation: TABLE" m))))

  	dispatch))

