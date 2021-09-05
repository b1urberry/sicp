;;applies the designated accu- mulation procedure to combine all the first elements of the sequences, 
 ;all the second elements of the sequences, and so on, and returns a sequence of the results
(define (accumulate_n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
      			(accumulate_n op init (map cdr seqs)))))