(defun say-hello()
  (print "Please type your Name:")
  (let ((name (read)))
    (print `(Nice to meet you ,name))))

(say-hello)