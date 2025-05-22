(define (flip f)
  (lambda (a b) (f b a)))

(define (curry f . argv)
  (lambda a (apply f (append argv a))))

(define (pipe-apply fns a)
  (if (null? fns) a (pipe-apply (cdr fns) ((car fns) a))))

(define (pipe-map fns args)
  (map (compose fns) args))

(define (pipe . fns)
  (curry pipe-apply fns))

(define (orelse . argv)
  (or (find (compose null? not) argv) '()))
