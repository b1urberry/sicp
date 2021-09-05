(load "helpers.scm")

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (eq-number? x num) (and (number? x) (= x num)))

(define (make-sum . items)
  (let ((sum-numbers (accumulate + 0 (filter number? items)))
  			(terms (filter (lambda (x) (not (number? x))) items)))
  	(cond ((null? terms) sum-numbers)
  	      ((= 0 sum-numbers) (cons '+ terms))
  	    	(else (append (cons '+ terms)
  	    								(list sum-numbers))))))
(define (addend s) (cadr s))
(define (augend s) (make-sum (cddr s)))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (make-product . items)
  (let ((product-numbers (accumulate * 1 (filter number? items)))
  			(terms (filter (lambda (x) (not (number? x))) items)))
  	(cond ((= 0 product-numbers) 0)
  	      ((= 1 product-numbers) (cons '* terms))
  	    	(else (append (cons '* terms)
  	    								(list product-numbers))))))
(define (multiplier p) (cadr p))
(define (multiplicand p) (make-product (cddr p)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (make-exponentiation base exponent)
	(cond ((eq-number? base 0) 0)
	      ((or (eq-number? base 1) (eq-number? exponent 0)) 1)
	    	((eq-number? exponent 1) base)
	    	((and (number? base) (number? exponent)) (expt base exponent))
	    	(else (list '** base exponent))))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))
 
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
      	((sum? exp) 
      	 (make-sum (deriv (addend exp) var)
      	 					 (deriv (augend exp) var)))
      	((product? exp)
      	 (make-sum (make-product (deriv (multiplier exp) var)
      	 												 (multiplicand exp))
      						 (make-product (deriv (multiplicand exp) var)
      						 							 (multiplier exp))))
      	((exponentiation? exp) 
      	 (make-product (make-exponentiation (base exp) (- (exponent exp) 1))
      	 							 (exponent exp)
      	 							 (deriv (base exp) var)))))










