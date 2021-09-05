(load "stream_helper.scm")

;;a)
(define (integrate-series coeff-stream)
  (stream-map / coeff-stream integers))

;;b)
(define cosine-series (cons-stream 1 (integrate-series (scale-stream sine-series -1))))
(define sine-series (cons-stream 0 (integrate-series cosine-series)))