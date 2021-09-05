;;=zero? for scheme numbers
(put '=zero? 'scheme-number zero?)

;;=zero? for rationals
(put '=zero? 'rationals (lambda (x) (zero? (numer x))))

;;=zero? for complex
(put '=zero? 'rationals (lambda (z) (zero? (magnitude z))))