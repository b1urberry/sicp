;;Suppose we type in the following definitions to the lazy evaluator:
(define count 0)
(define (id x) (set! count (+ count 1)) x)


;;Give the missing values in the following sequence of inter-
; actions, and explain your answers.

(define w (id (id 10))) 
;;; L-Eval input:
count
;;; L-Eval value: 
⟨response⟩
0
;;; L-Eval input:
w
;;; L-Eval value:
⟨response⟩
('thunk '(id 10) <e0>)
;;; L-Eval input: 
count
;;; L-Eval value: 
⟨response⟩
1