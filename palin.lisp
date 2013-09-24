(defun is-palin(number)
  (let ((s (prin1-to-string number)))
  	(equal (reverse s) s)))
