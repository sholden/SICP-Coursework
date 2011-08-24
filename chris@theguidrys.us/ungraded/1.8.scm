; Newton's method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is given by the
; value

; x/y² + 2y
; ----------
;     3

; Use this formula to implement a cube-root procedure analogous to the square-root
; procedure. (In section 1.3.4 we will see how to implement Newton's method in
; general as an abstraction of these square-root and cube-root procedures.)

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (cubert x)
  (cubert-iter 0.0 1.0 x))

(define (cubert-iter previous-guess this-guess x)
  (if (good-enough? previous-guess this-guess x)
      this-guess
      (cubert-iter this-guess (improve this-guess x) x)))

(define (good-enough? previous-guess this-guess x)
  (< (abs (- previous-guess this-guess)) (* this-guess 0.000000000000000000001)))
   
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))


; Test cases                                            calculator answer
(display (cubert 27))(newline)                        ; 3
(display (cubert (+ 100 37)))(newline)                ; 5.155136735
(display (cubert (+ (cubert 2) (cubert 3))))(newline) ; 1.392849703
(display (cube (cubert 1000)))(newline)               ; 1000

; a very small number
(display (cubert 0.0000009))(newline)                 ; 0.009654894
; a very large number
(display (cubert 12314124141241142412414))(newline)   ; 23092334.645018658
