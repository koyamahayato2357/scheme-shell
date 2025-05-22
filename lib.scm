(define pipe
  (lambda (arg fns)
    (if (null? fns)
      arg
      (pipe ((car fns) arg) (cdr fns)))))

(define pipe-map
  (lambda (fns args)
    (map (lambda (a) (pipe a fns)) args)))

(define orelse
  (lambda argv
    (if (null? argv)
      '()
      (let ((a (car argv)))
        (if (null? a)
          (apply orelse (cdr argv))
          a)))))
