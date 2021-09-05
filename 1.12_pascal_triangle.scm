
;; Pascal Triangle:
 ; the numbers at the edge of the triangle are all 1,  
 ; and each number inside the triangle is the sum of the two numbers

;; find number with index in the series
(define (pascal n)
  ; convert to row and index, returning a pair
  (define (convert sum row)
    (if (not (> n sum))
      (cons row (- row (- sum n)))
      (convert (+ sum row 1) (+ row 1))))
  (if (or (= n 1) (= n 2) (= n 3))
    1
    (let ((index (convert 3 2)))
      (if (or (= (cdr index) 1) (= (cdr index) (car index)))
        1
        (pascal_at (car index) (cdr index))))))

;; find number using row and index in the triangle
(define (pascal_at row index)
  (if (or (= row 1) (= row 2) (= index 1) (= index row))
    1
    (+ (pascal_at (- row 1) (- index 1)) 
       (pascal_at (- row 1) index))))