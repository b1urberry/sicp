(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream 
        low
        (stream-enumerate-interval (+ low 1) high))))

(define (display-stream s)
  (if (stream-null? s)
      'done
      (begin 
        (display (stream-car s))
        (display " ")
        (display-stream (stream-cdr s)))))

(define (mul-streams s1 s2) (stream-map * s1 s2))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define (scale-stream s factor)
  (stream-map 
    (lambda (x) (* x factor))
    s))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

;;Each new factorial is its previous factorial multiplied by the new integer
;for example, 6! is 5! multiplied by the integer 6
(define factorial (cons-stream 1 (mul-streams (stream-cdr integers) factorial)))

;;takes as argument a stream S and returns the stream whose ele- ments are S0, S0+S1, S0+S1+S2, ...
(define (partial-sums s)
  (define sums
    (cons-stream 
      (stream-car s)
      (add-streams
        (stream-cdr s)
        sums)))
  sums)

(define (eular-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (eular-transform (stream-cdr s)))))

;;create a stream of stream (a tableau)
;the tableau starts with the original stream "s"
;and each element of the tableau is a stream that is the transform of its previous element (which is also a stream)
(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform 
                             (transform s))))

;;returns a stream made up of the first element of each element (that is a stream) of a tableau
(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))


(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream 
      initial-value
      (let ((integrand (force delayed-integrand)))
        (add-streams 
          (scale-stream integrand dt)
          int))))
  int)

(define (show-stream s n)
  (if (= n 1)
      'done
      (begin 
        (display (stream-car s))
        (newline)
        (show-stream (stream-cdr s)
                     (- n 1)))))






















