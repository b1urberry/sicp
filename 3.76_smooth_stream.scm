(define (smooth s)
  (stream-map avg
  						s
  						(stream-cdr s)))

(define (zero-crossings s)
  (stream-map sign-change-detector
  						(smooth s)
  						(stream-cdr (smooth s))))

(define (avg a b) (/ (+ a b) 2))