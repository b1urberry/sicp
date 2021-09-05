;; checks the primality of consecutive odd integers in a specified range
(define (search_for_prime start count)
  (define (next n)
    (if (even? n)
      (+ n 1)
      (+ n 2)))
  (cond ((= count 0) (display "DONE"))
        ((timed_prime_test? prime? start) (search_for_prime (next start) (- count 1)))
        (else (search_for_prime (next start) count))))

(define (timed_prime_test? test_prime? n)
  (newline)
  (display n)
  (define (start_test start_time)
    (if (test_prime? n)
      (report_prime start_time)
      false))
  (define (report_prime start_time)
    (display " *** ")
    (display (- (runtime) start_time)))
  (start_test (runtime)))