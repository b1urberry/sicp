(define (tree_map f tree)
  (map (lambda (subtree) 
         (if (pair? subtree)
           (tree_map f subtree)
           (f subtree)))
       tree))

(define (square_tree tree)
  (tree_map square tree))