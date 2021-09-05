;;; computes the nth element of the pascal triangle
(define (pascal n)
  (let ((row (car (convert n)))
        (index (cadr (convert n))))
    ;; if the element is at first or last most index of a row, the element is 1
    ;; else it's the sum of 2 pascal elemets above, which are (n - row)th and (n - row + 1)th elements
    (if (or (= index 1) (= index row))
        1
        (+ (pascal (- n row)) (pascal (- (+ n 1) row))))))

;;; computes the position of nth element in the pascal triangle
;;; in terms of row and index in the row
(define (convert n)
  (define (iter row sum)
    (if (>= sum n)                       ;found the row which the nth element is in
        (list row (- row (- sum n)))     ;return the (row, index) pair
        (iter (+ row 1) (+ sum row 1)))) ;with each iteration, add row by 1, add the number of elements in the new row to sum
  (iter 1 1))