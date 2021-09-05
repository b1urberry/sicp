(define (rand m)
  (let ((x rand-init))
  	(cond ((eq? m 'generate) (lambda () (set! x (rand-update x)) x))
  	      ((eq? m 'new-value) (lambda (new-value) (set! x (rand-update new-value)) x))
  	    	(else (error "unknown rand request" m)))))

(define rand-init 1)

(define (rand-update x) (random (expt 2 31)))