
;;takes a list as argument and returns as its value the list with its elements reversed 
 ;and with all sublists deep-reversed as well.
(define (deep_reverse items)
  (define (iter l result)
    (cond ((null? l) result)
          ((not (pair? l)) l)
          ;nested iteration
          (else (iter (cdr l) 
                      (cons (iter (car l) ()) 
                            result)))))
  (iter items ()))

;;implemented using built-in procedures map and reverse
(define (deep_reverse_map items)
	(if (pair? items)
	    (map deep_reverse_map (reverse items))
	    items))