(define pipe
  (lambda (arg fns)
    (if (null? fns)
      arg
      (pipe ((car fns) arg) (cdr fns)))))

(define pipe-map
  (lambda (fns args)
    (map (lambda (a) (pipe a fns)) args)))
