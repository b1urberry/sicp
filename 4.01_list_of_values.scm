;;force the evaluation of the operands by using nested let
; a single let won't work because (let ((a v1) (b v2))) is the same as ((lambda (a b) ...) v1 v2), 
; which will evaluate v1 v2 by the same order as the underlying scheme.
(define (list-of-values exps env)
   (if (no-operands? exps)
       '()
       (let ((left (car (operands exps))))
       	(let ((right (cdr (operands exps))))
       		(cons left right)))))
