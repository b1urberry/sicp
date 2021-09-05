(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf leaf) (cadr leaf))
(define (weight-leaf leaf) (caddr leaf))

(define (make-code-tree left right)
  (list left
  			right
  			(append (symbols left) (symbols right))
  			(+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols object)
  (if (leaf? object)
      (list (symbol-leaf object))
      (caddr object)))
(define (weight object)
  (if (leaf? object)
      (weight-leaf object)
      (cadddr object)))


(define (ajoin-set x set)
  (cond ((null? set) (list x))
        ((<= (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (ajoin-set x (cdr set))))))
;;takes a list of symbol-frequency pairs constructs an initial ordered set of leaf-set
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (ajoin-set (make-leaf (car (car pairs)) (cadr (car pairs))) (make-leaf-set (cdr pairs)))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
				(else (element-of-set? x (cdr set)))))

(define (decode bits tree)
	;;lesson: notice here we define another "decode1" procedure inside "decode"
	 ;to keep track of the ROOT.
  (define (decode1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
        	(if (leaf? next-branch)
        			;;if the next branch is a leaf, we have reached the end of one symbol's code.
        			 ;we keep this symbol and start decoding the rest of the bits for the rest of the symbols.
        	    (cons (symbol-leaf next-branch) (decode1 (cdr bits) tree))
        	    ;;if not, we haven't reached the end of one symbol's code, so keep decoding for this symbol.
        	    (decode1 (cdr bits) next-branch)))))
	(decode1 bits tree))
(define (choose-branch bit current-branch)
  (cond ((= 0 bit) (left-branch current-branch))
        ((= 1 bit) (right-branch current-branch))
      	(else (error "bad bit: not 0 or 1"))))

;;order of growth???
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
      				(encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (display tree)
  (newline)
  (let ((left (left-branch tree))
        (right (right-branch tree)))
    (cond ((and (leaf? left) (eq? (symbol-leaf left) symbol)) (list 0))
          ((element-of-set? symbol (symbols left)) (append (list 0) (encode-symbol symbol left)))
          ((and (leaf? right) (eq? (symbol-leaf right) symbol)) (list 1))
          (else (append (list 1) (encode-symbol symbol right))))))

(define (generate-huffman-tree pairs)
  (define (successive-merge leaf-set)
    (if (null? (cdr leaf-set))
        (car leaf-set)
        (successive-merge
          (ajoin-set (make-code-tree (cadr leaf-set) (car leaf-set))
                          (cddr leaf-set)))))
  (successive-merge (make-leaf-set pairs)))

(define sample-tree 
	(make-code-tree (make-leaf 'A 4)
									(make-code-tree (make-leaf 'B 2) 	
																	(make-code-tree (make-leaf 'D 1)
																									(make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))


























