(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
    	;;executes procedure (2nd argument) after the delay(1st argument)
    	(after-delay inverter-delay
    							 ;;set the signal on output wire to new-value
    							 (set-signal! output new-value)))
    ;;executes procedure (inverter) if the wire (input) changes its value
  	(set-action! input inverter)))

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
      	(else (error "invalid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-gate-procedure)
    (let ((new-value (logical-and (get-signal a1) (get-signal a2))))
    	(after-delay and-gate-delay
    							 (set-signal! output new-value)))
  	(set-action! a1 and-gate-procedure)
  	(set-action! a2 and-gate-procedure)))

(define (logical-and s1 s2)
  (if (and (<= s1 1) (<= s2 1))
      (if (and (= 1 s1) (= 1 s2))
          1
          0)
      (error "invalid signal" s1)))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
    	(after-delay or-gate-delay
    							 (lambda () (set-signal! output new-value))))
  	(add-action! a1 or-action-procedure)
  	(add-action! a2 or-action-procedure)))

(define (logical-or a1 a2)
  (if (and (<= s1 1) (<= s2 1))
      (if (and (= 0 s1) (= 0 s2))
          0
          1)
      (error "invalid signal" s1)))

(define (half-adder a b s c)
  (let ((d (make-wire))
  			(e (make-wire)))
  	(or-gate a b d)
  	(and-gate a b c)
  	(inverter c e)
  	(and-gate d e s)
  	'ok))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
  			(c1 (make-wire))
  			(c2 (make-wire)))
  	(half-adder b c-in s c1)
  	(half-adder a s sum c2)
  	(or-gate c1 c2)
  	'ok))


(define (make-wire)
  (let ((signal-value 0)
  			(action-procedures '()))

  	(define (set-my-signal! new-value)
  	  (if (not (= new-value signal-value))
  	      (begin (set! signal-value new-value)
  	      			 (call-each action-procedures))
  	      'done))

  	(define (accept-action-procedure! proc)
  	  (set! action-procedures 
  	  			(cons proc action-procedures))
  		(proc))

  	(define (dispatch m)
  	  (cond ((eq? m 'get-signal) signal-value)
  	        ((eq? m 'set-signal!) set-my-signal)
  	      	((eq? m 'set-action!)	accept-action-procedure)
  	      	(else (error "unknown method" m)))))
		dispatch)

(define (get-signal wire) (wire 'get-signal))
(define (set-signal! wire new-value) ((wire 'set-signal!) new-value))
(define (set-action! wire proc) ((wire 'accept-action-procedure!) proc))
(define (call-each procedures)
  (if (null? procedures)
      'done
      (begin ((car procedures))
      			 (call-each (cdr procedures)))))


































