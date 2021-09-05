(define (count_leaves tree)
  (accumulate +
  						0
  						(map (lambda (x) (if (pair? x) (count_leaves x) 1))
  								 tree)))