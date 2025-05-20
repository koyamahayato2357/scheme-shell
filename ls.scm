(define first-non-option
  (lambda argv
    (if (null? argv)
      '()
      (let ((a (car argv)))
        (if (and (string? a) (= #\- (string-ref a 0)))
          (first-non-option (cdr argv))
          a)))))

(define orelse
  (lambda argv
    (if (null? argv)
      '()
      (let ((a (car argv)))
        (if (null? a)
          (apply orelse (cdr argv))
          a)))))

(define long-format
  (lambda (name)
    (call-with-input-file
      name
      (lambda (port)
        (list
          (get-mode name)
          (file-length port)
          (file-modification-time port)
          name)))))

(define ls
  (lambda argv
    (let ((name (orelse (first-non-option argv) ".")))
      (if (file-directory? name)
        (directory-list name)
        (if (file-exists? name) name '())))))
