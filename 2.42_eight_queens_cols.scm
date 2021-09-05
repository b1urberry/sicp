(load "helpers.scm")

(define (queens board_size)

	(define (safe? new_queens)
		(define (safe_row? row positions)
		  (null? (filter (lambda (position) (= (get_row position) row)) positions)))
		(define (safe_diag? new positions)
		  (null? (filter (lambda (position) 
		  								 (= (abs (- (get_row new) (get_row position)))
		  								 		(abs (- (get_col new) (get_col position)))))
		  							 positions)))
		(and (safe_row? (get_row (car new_queens)) (cdr new_queens))
				 (safe_diag? (car new_queens) (cdr new_queens))))

	(define (append_position positions new_row new_col)
	  (cons (pos new_row new_col) positions))

  (define (queens_cols k)
    (if (= k 0)
        (list ())
        (filter safe?
        				(flatmap (lambda (located_queens)
        												 (map (lambda (new_row)
        												 							(append_position located_queens new_row k))
        												 			(enumerate_interval 1 board_size)))
        								 (queens_cols (- k 1))))))
  (print_queens (queens_cols board_size) board_size))

(define (pos r c) (list r c))
(define (get_row position) (car position))
(define (get_col position) (cadr position))

(define (print_queens solution_set board_size)
  (for-each (lambda (solution) 
  						(display solution)
  						(newline)
  						)
  					solution_set))