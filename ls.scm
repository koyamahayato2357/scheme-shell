(load "lib.scm")

(define (fst-c-eq c s) (char=? c (string-ref s 0)))

(define (option? s) (not (fst-c-eq #\- s)))

(define (long-format name)
  (call-with-input-file
    name
    (lambda (port)
      (list
        (get-mode name)
        (file-length port)
        (file-modification-time port)
        name))))

(define (default-filter s) (fst-c-eq #\. s))

(define (file-dir name)
  (if (file-dir name)
    (directory-list name)
    (if (file-exists? name) name '())))

(define (ls . argv)
  (let ((names (orelse (filter option? argv) '("."))))
    (map file-dir names)))
