(define (mul-streams s1 s2) (stream-map * s1 s2))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

;;Each new factorial is its previous factorial multiplied by the new integer
 ;for example, 6! is 5! multiplied by the integer 6
(define factorial (cons-stream 1 (mul-streams (stream-cdr integers) factorial)))