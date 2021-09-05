(load "huffman_tree.scm")

(define word-list
	'((A 2)
		(GET 2)
		(SHA 3)
		(WAH 1)
		(BOOM 1)
		(JOB 2)
		(NA 16)
		(YIP 9)))

(define lyric '(Get a job
Sha na na na na na na na na
Get a job
Sha na na na na na na na na
Wah yip yip yip yip yip yip yip yip yip
Sha boom))

;;to use fixed-length encoding, needs 3 bits for each word