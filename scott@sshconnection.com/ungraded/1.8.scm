(define (square x) (* x x))
(define (cube x) (* x x x))

(define (cubert x)
    (define (good-enough? guess)
      (< (abs (- (cube guess) x)) 0.001))
    (define (improve guess)
      (/ (+ (/ x (square guess)) (* 2 guess)) 3))
    (define (cubert-iter guess)
      (display guess)(newline)
      (if (good-enough? guess)
          guess
          (cubert-iter (improve guess))))
	(cubert-iter 1.0))