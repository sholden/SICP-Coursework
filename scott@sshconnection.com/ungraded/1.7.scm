(define (square x) (* x x))
(define (cube x) (* x x x))
(define (average x y) (/ (+ x y) 2))

(define (squarert x)
  (define acceptable-proximity 0.00000001)
  (define (good-enough? guess previous)
    (< (/ (abs (- guess previous)) guess) acceptable-proximity))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess previous)
    (if (good-enough? guess previous)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 0))

