(define (square x) (* x x))
(define (sum-largest-squares a b c)
  (cond ((and (> a c) (> b c)) (+ (square a) (square b)))
        ((and (< a b) (< a c)) (+ (square b) (square c)))
        (else (+ (square a) (square c)))))

; Grading (CAG): The tests below should all report 25 and they do!  Man
;                what I wouldn't give to use some list processing, because
;                everything in my body screamed out "write a procedure to find
;                the largest two values in a list".  I guess that's a later
;                chapter.
(display (sum-largest-squares 2 3 4))(newline)
(display (sum-largest-squares 2 4 3))(newline)
(display (sum-largest-squares 3 2 4))(newline)
(display (sum-largest-squares 3 4 2))(newline)
(display (sum-largest-squares 4 3 2))(newline)
(display (sum-largest-squares 4 2 3))(newline)
