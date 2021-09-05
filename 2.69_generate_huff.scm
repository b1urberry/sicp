(define (generate-huffman-tree pairs)
  (define (successive-merge leaf-set)
    (if (null? (cdr leaf-set))
        (car leaf-set)
        (successive-merge
          (ajoin-set (make-code-tree (cadr leaf-set) (car leaf-set))
                          (cddr leaf-set)))))
  (successive-merge (make-leaf-set pairs)))