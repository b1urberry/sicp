(define (fold_right op init seq)
  (if (null? seq)
      init
      (op (car seq)
      		(fold_right op init (cdr seq)))))	

(define (fold_left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
        			(cdr rest))))
	(iter init seq))

(define (reverse_r seq)
  (fold_right (lambda (x y) (append y (list x))) () seq))

(define (reverse_l seq)
  (fold_left (lambda (x y) (cons y x)) () seq))