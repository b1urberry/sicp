(load "helpers.scm")

(define (queens board_size)
  
  ;;constructor and selectors of a position
  (define (pos r c) (list r c))
  (define (row position) (car position))
  (define (col position) (cadr position))

  ;;check if the set of queens' positions is valid
  (define (safe? queens_positions)
    (let ((new_queen (car queens_positions))
    			(old_queens (cdr queens_positions)))
    	(define (safe_col?)
    	  (null? (filter (lambda (queen_pos) (= (col new_queen) (col queen_pos)))
    	  							 old_queens)))
    	(define (safe_diag?)
    	  (null? (filter (lambda (queen_pos) 
    	  								 (= (abs (- (col new_queen) (col queen_pos)))
    	  								 		(abs (- (row new_queen) (row queen_pos)))))
    	  							 old_queens)))
    	(and (safe_col?) (safe_diag?))))

  ;;append a new queen's position to the set of queens already positioned
  (define (append_queen old_queens new_row new_col)
    (cons (pos new_row new_col) old_queens))

  (define (print_solutions solution_set board_size)
  	(define (print_row length pos)
  	  (define (iter count)
  	    (cond ((> count length) (newline))
  	          ((= count (col pos)) (display "x ")
  	          										 (iter (+ count 1)))
  	        	(else (display "_ ")
  	        				(iter (+ count 1)))))	
  		(iter 1))
	  (for-each (lambda (solution) 
	  						(let ((reversed (reverse solution)))
	  							(display reversed)
		  						(newline)
		  						(for-each (lambda (queen_pos) (print_row board_size queen_pos))
		  											reversed))
	  						)
  						solution_set))

  ;;nested map
  (define (queens_row r)
    (if (= 0 r)
        (list ())
        (filter safe?
        				(flatmap (lambda (old_queens) 
        									 (map (lambda (new_col) 
        									 				(append_queen old_queens r new_col))
        									 			(enumerate_interval 1 board_size)))
        								 (queens_row (- r 1))))))

  (print_solutions (queens_row board_size) board_size)
)