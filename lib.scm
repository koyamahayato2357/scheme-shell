(define (pipe a fns)
  (if (null? fns) a (pipe ((car fns) a) (cdr fns))))

(define (pipe-map fns args)
  (map (lambda (a) (pipe a fns)) args))

; (compose f g) = (lambda (x) (g (f x)))
(define (compose . fns)
  (lambda (x) (pipe x fns)))

(define (orelse . argv)
  (or (find (compose null? not) argv) '()))
