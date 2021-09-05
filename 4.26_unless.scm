(define (unless->if exp)
  (make-if (unless-condition exp)
           (unless-exception exp)
           (unless-usual exp)))