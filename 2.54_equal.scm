(define (equal item1 item2)
  (if (not (pair? item1))
      (eq? item1 item2)
      (and (eq? (car item1) (car item2))
      		 (equal (cdr item1) (cdr item2)))))		