;;a)
; prcedure application expressions are NOT TAGGED LISTS.
; (application? exp) translates to (pair? exp)
; since most expressions are pairs, (application? exp) cannot distinguisth them

;;b)
; changing the syntax of the evaluated language so that procedure applications start with call
; instead of (factorial 3) we will now have to write (call factorial 3)
; instead of (+ 1 2) we will have to write (call + 1 2).
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operand exp) (caddr exp))

