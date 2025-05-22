(define pipe
  (lambda (a fns)
    (if (null? fns) a (pipe ((car fns) a) (cdr fns)))))

(define pipe-map
  (lambda (fns args)
    (map (lambda (a) (pipe a fns)) args)))

; (compose f g) = (lambda (x) (g (f x)))
(define compose
  (lambda fns
    (lambda (x) (pipe x fns))))

(define orelse
  (lambda argv
    (if (null? argv)
      '()
      (let ((a (car argv)))
        (if (null? a)
          (apply orelse (cdr argv))
          a)))))
