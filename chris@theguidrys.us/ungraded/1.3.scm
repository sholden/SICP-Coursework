;Define a procedure that takes three numbers as arguments and returns the sum of
;the squares of the two larger numbers.

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (sum-of-largest-squares x y z)
  (cond ((and (> x z) (> y z)) (sum-of-squares x y))
        ((and (> y x) (> z x)) (sum-of-squares y z))
        ((and (> z y) (> x y)) (sum-of-squares x z)) ))

(display (sum-of-largest-squares 2 3 4))(newline)
(display (sum-of-largest-squares 2 4 3))(newline)
(display (sum-of-largest-squares 3 2 4))(newline)
(display (sum-of-largest-squares 3 4 2))(newline)
(display (sum-of-largest-squares 4 3 2))(newline)
(display (sum-of-largest-squares 4 2 3))(newline)
