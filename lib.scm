(define (flip f)
  (lambda (a b) (f b a)))

(define (curry f . argv)
  (lambda a (apply f (append argv a))))

(define pipe
  (curry fold-left (lambda (x f) (f x))))

(define (pipef . fns)
  (curry (flip pipe) fns))

(define (pipe-map fns args)
  (map (pipef fns) args))

(define (compose . fns)
  (curry pipef (reverse fns)))

(define (orelse . argv)
  (or (find (pipef null? not) argv) '()))
