(define (split to-identity to-split painter n)
  (let ((smaller (split to-identity to-split (- n 1))))
  	(to-identity painter (to-split smaller smaller))))