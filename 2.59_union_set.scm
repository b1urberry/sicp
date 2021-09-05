(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
				(else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (append set2
  				(filter (lambda (item) (not (element-of-set? item set2))) set1))