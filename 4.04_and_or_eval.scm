(define (and? exp) (eq? (car exp) 'and))
(define (eval-and exp env)
  (if (true? (car exp) env)
      (eval-and (cdr exp) env)
      false))
(define (eval-or exp env)
  (if (true? (car exp) env)
      true
      (eval-or (cdr exp) env)))

(define (eval-and exp env)
  (if (eval-or (car exp) env)
      (eval-and (cdr exp))
      false))

(define (eval-or exp env)
  (if (eval-and (car exp) env)
      true
      (eval-or (cdr exp) env)))
