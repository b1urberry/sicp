(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
				(else (element-of-set? x (cdr set)))))

(define (ajoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (filter (lambda (item) (element-of-set? item set2)) set1))

(define (intersection-set1 set1 set2)
  (cond ((null? set1) '())
        ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
				(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (append set2
  				(filter (lambda (item) (not (element-of-set? item set2))) set1))