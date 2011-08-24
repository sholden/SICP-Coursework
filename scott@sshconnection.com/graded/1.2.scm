(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

; Grading (CAG): This is what I got, and it gives the same answer (-37/150).  This
;                was an unexpected result, and it looks like Scheme has first-class
;                support for rational numbers.  The decimal approximation I got 
;                from this expression and from the original both come to −0.246666667.
