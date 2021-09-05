(define (make-table same-key?)

  (define (assoc key records predicate?)
	  (cond ((null? records) false)
	        ((predicate? key (caar records)) (car records))
	      	(else (assoc key (cdr records) predicate?))))

	(let ((local-table (list '*table*)))
		(define (lookup table . keys)
		  (let ((subtable (assoc (car keys) (cdr table) same-key?)))
		  	(if (subtable)
		  			;;value is found when keys reaches end and (cadr subtable) holds a single value
		  	    (cond ((and (null? (cdr keys)) 
		  	    						(not (pair? (cadr subtable)))) 
		  	  				 (cadr subtable))
		  	          (else (lookup (cdr subtable) (cdr keys))))
		  	    false)))

		(define (insert! table value . keys)
		  (let ((subtable (assoc (car keys) (cdr table) same-key?)))
		  	(cond ((and subtable 
		  							(null? (cdr keys))) 
		  				 (set-cdr! subtable value))
		  	      ((and (not subtable) 
		  	      			(null? (cdr keys))) 
		  	    	 (set-cdr! table 
		  	    	 					 (cons (cons (car keys) value)
		  	    	 					 			 (cdr table))))
		  	    	((and (not subtable)
		  	    				(not (null? (cdr keys))))
		  	    	 (set-cdr! table
		  	    	 					 (cons (cons (car keys) '())
		  	    	 					 			 (cdr table)))
		  	    	 (insert! table value (cdr keys)))
		  	    	(else (insert! subtable value (cdr keys))))))))