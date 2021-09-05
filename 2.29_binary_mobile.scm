(define (make_mobile left right)
  (list left right))

(define (make_branch length structure)
  (list length structure))

;;a
(define (left_branch mobile) (car mobile))
(define (right_branch mobile) (car (cdr mobile)))
(define (branch_length branch) (car branch))
(define (branch_structure branch) (car (cdr branch))

;;b
(define (total_weight item)
  (if (number? item)
    item
    (+ (total_weight (branch_structure (left_branch item)))
       (total_weight (branch_structure (right_branch item))))))

;;c
(define (balanced? item)
  (if (number? item)
    true
    (let ((l_branch (left_branch item)
          (r_branch (right_branch item))))
      (let ((l_item (branch_structure l_branch))
            (r_item (branch_structure r_branch)))
        (let ((l_torque (* (total_weight l_item) (branch_length l_branch)))
              (r_torque (* (total_weight r_item) (branch_length r_branch))))
          (and (= l_torque r_torque)
               (balanced? l_item)
               (balanced? r_item)))))))