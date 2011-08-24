; The good-enough? test used in computing square roots will not be very effective
; for finding the square roots of very small numbers. Also, in real computers,
; arithmetic operations are almost always performed with limited precision. This
; makes our test inadequate for very large numbers. Explain these statements, with
; examples showing how the test fails for small and large numbers. An alternative
; strategy for implementing good-enough? is to watch how guess changes from one
; iteration to the next and to stop when the change is a very small fraction of
; the guess. Design a square-root procedure that uses this kind of end test. Does
; this work better for small and large numbers?

; Answer:
; For very small numbers, a difference of 0.001 between the answers is not appropriate,
; since that would allow a number several orders of magnitude too large to be considered
; the correct answer.
; For very large numbers, a large amount of precision is lost, essentially capping any
; answer to 3 fractional digits.
; 

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (average x y)
  (/ (+ x y) 2))
  
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
  
(define (improve guess x)
  (average guess (/ x guess)))


(display "Original Implementation")(newline)
; Test cases                                        ; original good-enough?     calculator answer
(display (sqrt 9))(newline)                         ; 3.00009155413138          3
(display (sqrt (+ 100 37)))(newline)                ; 11.704699917758145        11.704699911
(display (sqrt (+ (sqrt 2) (sqrt 3))))(newline)     ; 1.7739279023207892        1.773771228
(display (square (sqrt 1000)))(newline)             ; 1000.000369924366         1000

; a very small number
(display (sqrt 0.0000009))(newline)                 ; 0.031259590038105         0.000948683
; a very large number
(display (sqrt 12314124141241142412414))(newline)   ; 110969023340.936          110969023340.935746078



; Redesigned
(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))
  
(define (sqrt-iter previous-guess this-guess x)
  (if (really-good-enough? previous-guess this-guess x)
      this-guess
      (sqrt-iter this-guess (improve this-guess x) x)))

(define (really-good-enough? previous-guess this-guess x)
  (< (abs (- previous-guess this-guess)) (* this-guess 0.000000000000000000001)))




(newline)
(display "New Implementation")(newline)
; Test cases                                        ; new tests                 calculator answer
(display (sqrt 9))(newline)                         ; 3.0                       3
(display (sqrt (+ 100 37)))(newline)                ; 11.7046999107196          11.704699911
(display (sqrt (+ (sqrt 2) (sqrt 3))))(newline)     ; 1.77377122818642          1.773771228
(display (square (sqrt 1000)))(newline)             ; 1000.0                    1000

; a very small number
(display (sqrt 0.0000009))(newline)                 ; 9.48683298050514e-4       0.000948683
; a very large number
(display (sqrt 12314124141241142412414))(newline)   ; 110969023340.936          110969023340.935746078
