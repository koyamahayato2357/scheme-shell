(define (flip f)
  (lambda (a b) (f b a)))

(define (curry f . argv)
  (lambda a (apply f (append argv a))))

(define (pipe a fns)
  (if (null? fns) a (pipe ((car fns) a) (cdr fns))))

(define (pipe-map fns args)
  (map (compose fns) args))

; (compose f g) = (lambda (x) (g (f x)))
(define (compose . fns)
  (curry (flip pipe) fns))

(define (orelse . argv)
  (or (find (compose null? not) argv) '()))
