(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
				(else (element-of-set? x (cdr set)))))

(define (ajoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  )